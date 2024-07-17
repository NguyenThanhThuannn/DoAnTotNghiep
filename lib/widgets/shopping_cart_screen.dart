import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../config/format_number.dart';
import '../config/image.dart';
import '../config/textStyle.dart';
import '../features/checkoutpage/presentation/view/checkout_screen.dart';
import '../features/homepage/domain/entities/product.dart';
import '../features/homepage/presentation/bloc/home_page_bloc.dart';
import '../features/loginregisterpage/data/model/user_model.dart';
import '../features/loginregisterpage/data/services/provider.dart';
import '../features/loginregisterpage/presentation/bloc/user_bloc.dart';
import '../injection_container.dart';
import '../network/end_points.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<ProductEntity> shoppingCartItems = [];
  @override
  void initState() {
    context.read<UserBloc>().add(
          GetUserById2(
            Provider.of<UserProvider>(context, listen: false).getUser!.id!,
          ),
        );
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (final context, final state) {
        if (state is UserLoading) {
          return Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  //context.read<UserBloc>().add(GetUserById2(Provider.of<UserProvider>(context,listen: false).getUser!.id!));
                  Navigator.pop(context);
                },
                child: const Icon(Icons.keyboard_arrow_left_outlined),
              ),
              title: Text(
                'Cart',
                style: textStylePlusJakartaSansMedium14Height1point5,
              ),
            ),
            body: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
        if (state is UserLoaded) {
          shoppingCartItems = state.user!.shopping_cart!.items!;
          log(shoppingCartItems.toString());
          return Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.keyboard_arrow_left_outlined),
              ),
              title: Text(
                'Cart',
                style: textStylePlusJakartaSansMedium14Height1point5,
              ),
            ),
            body: shoppingCartItems.isNotEmpty
                ? ListView.builder(
                    itemCount: shoppingCartItems.length,
                    itemExtent: 200,
                    padding: const EdgeInsets.only(bottom: 50),
                    itemBuilder: (final context, final index) {
                      return Dismissible(
                        key: Key(shoppingCartItems[index].toString()),
                        crossAxisEndOffset: 0.05,
                        direction: DismissDirection.endToStart,
                        confirmDismiss: (final direction) async {
                          if (direction == DismissDirection.endToStart) {
                            final bool confirm = await showDialog(
                              context: context,
                              builder: (final BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Lưu ý'),
                                  content: const Text('Xóa sản phẩm này?'),
                                  actions: [
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                          Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          Navigator.of(context).pop(true);
                                        });
                                      },
                                      child: const Text('OK'),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                          Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: const Text('CANCEL'),
                                    ),
                                  ],
                                );
                              },
                            );

                            return confirm ?? false;
                          }
                          return null;
                        },
                        onDismissed: (final direction) {
                          try {
                            deleteProductInCart(shoppingCartItems[index].id!)
                                .then(
                              (final value) => context.read<UserBloc>().add(
                                    GetUserById2(
                                      Provider.of<UserProvider>(
                                        context,
                                        listen: false,
                                      ).getUser!.id!,
                                    ),
                                  ),
                            );
                            setState(() {
                              shoppingCartItems.removeAt(index);
                            });

                            showDialog(
                              context: context,
                              builder: (final BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Thông báo'),
                                  content:
                                      const Text('Xóa sản phẩm thành công'),
                                  actions: [
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                          Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } catch (e) {
                            log(e.toString());
                          }
                        },
                        background: Container(
                          color: Colors.red,
                          child: const Align(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        child: CartItem(product: shoppingCartItems[index]),
                      );
                    },
                  )
                : const Center(
                    child: Text('Không có sản phẩm trong giỏ hàng'),
                  ),
            bottomSheet: Visibility(
              visible: state.user!.shopping_cart!.items!.isEmpty ? false : true,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (final context) =>
                          CheckOutScreen(lstProInCO: shoppingCartItems),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 13, 144, 250),
                        Color.fromARGB(255, 201, 224, 244),
                      ],
                    ),
                  ),
                  child: Text(
                    'CHECK OUT',
                    style: textStyleInterSemiBold18W,
                  ),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class CartItem extends StatefulWidget {
  const CartItem({
    super.key,
    required this.product,
  });
  final ProductEntity product;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quanlity = 0;
  late TextEditingController quanlityController = TextEditingController();

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (final context, final state) {
        if (state is HomePageLoaded) {
          ProductEntity? pro;
          pro = state.products!.firstWhere(
            (final element) => element.id == widget.product.product_item_id,
          );
          return Row(
            children: [
              CachedNetworkImage(
                imageUrl: widget.product.product_image![0] == 'i'
                    ? '${EndPoints.urlImage}${widget.product.product_image}'
                    : widget.product.product_image!,
                imageBuilder: (final context, final imageProvider) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
                progressIndicatorBuilder:
                    (final context, final url, final progress) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 2,
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.08)),
                      child: const CupertinoActivityIndicator(),
                    ),
                  );
                },
                errorWidget: (final context, final url, final error) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 2,
                    color: Colors.black.withOpacity(0.04),
                  );
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                height: MediaQuery.of(context).size.width / 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Text(
                          pro.name!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: textStyleInterMedium18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        CurrencyFormatter()
                            .formatNumber(pro.product_item!.price!),
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (final context, final state) {
                        if(state is UserLoaded){
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (widget.product.qty! > 1) {
                                  // quanlity--;
                                  UpdateProductInCart(
                                    Provider.of<UserProvider>(
                                      context,
                                      listen: false,
                                    ).getUser!.id!,
                                    pro!,
                                    -1,
                                  ).then(
                                    (final value) =>
                                        context.read<UserBloc>().add(
                                              GetUserById2(
                                                Provider.of<UserProvider>(
                                                  context,
                                                  listen: false,
                                                ).getUser!.id!,
                                              ),
                                            ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      showCloseIcon: true,
                                      duration: const Duration(seconds: 1),
                                      content: Text(
                                          'Đã cập nhật số lượng ${pro.name}',),
                                    ),
                                  );
                                } else {
                                  /* deleteProductInCart(widget.product.id!).then(
                                                  (final value) => context.read<UserBloc>().add(
                                                        GetUserById2(
                                                          Provider.of<UserProvider>(
                                                            context,
                                                            listen: false,
                                                          ).getUser!.id!,
                                                        ),
                                                      ),
                                                ); */
                                  showDialog(
                                    context: context,
                                    builder: (final BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Cảnh báo'),
                                        content: const Text(
                                          'Bạn có chắc muốn xóa sản phẩm này!',
                                        ),
                                        actions: [
                                          TextButton(
                                            style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStatePropertyAll(
                                                Theme.of(context).primaryColor,
                                              ),
                                            ),
                                            onPressed: () {
                                              deleteProductInCart(
                                                widget.product.id!,
                                              );
                                              context.read<UserBloc>().add(
                                                    GetUserById2(
                                                      Provider.of<UserProvider>(
                                                        context,
                                                        listen: false,
                                                      ).getUser!.id!,
                                                    ),
                                                  );
                                              Navigator.pop(context);
                                            },
                                            child: const Text('OK'),
                                          ),
                                          TextButton(
                                            style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStatePropertyAll(
                                                Theme.of(context).primaryColor,
                                              ),
                                            ),
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: const Text('CANCEL'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const FaIcon(FontAwesomeIcons.minus),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                quanlityController.clear();
                                //quanlityController.text = quanlity.toString();
                                showDialog(
                                  context: context,
                                  builder: (final BuildContext context) {
                                    return AlertDialog(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Chỉnh số lượng sản phẩm:',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Số lượng tối đa: ',
                                                  style: const TextStyle(
                                                      fontSize: 15,),
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          '${pro!.product_item!.qty_in_stock!}',
                                                      style: const TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      content: TextField(
                                        controller: quanlityController,
                                        onChanged: (final value) {
                                          setState(() {
                                                          
                                          quanlityController
                                              .text = (int.parse(value) <= 0 ||
                                                      (int.parse(value) >
                                                          pro!.product_item!
                                                              .qty_in_stock!)
                                                  ? 1
                                                  : value)
                                              .toString();
                                          });
                                        },
                                      ),
                                      actions: [
                                        TextButton(
                                          style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStatePropertyAll(
                                              Theme.of(context).primaryColor,
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              int temp = 1;
                                              temp = int.parse(
                                                quanlityController.text,
                                              );
                                              temp = temp -
                                                  widget.product.qty!;
                                              UpdateProductInCart(
                                                Provider.of<UserProvider>(
                                                  context,
                                                  listen: false,
                                                ).getUser!.id!,
                                                pro!,
                                                temp,
                                              ).then((final value) {
                                                context.read<UserBloc>().add(
                                                      GetUserById2(
                                                        Provider.of<
                                                            UserProvider>(
                                                          context,
                                                          listen: false,
                                                        ).getUser!.id!,
                                                      ),
                                                    );
                                              });
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('SAVE'),
                                        ),
                                        TextButton(
                                          style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStatePropertyAll(
                                              Theme.of(context).primaryColor,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('CANCEL'),
                                        ),
                                      ],
                                    );
                                  },
                                ).then((final value) => context.read<UserBloc>().add(
                                              GetUserById2(
                                                Provider.of<UserProvider>(
                                                  context,
                                                  listen: false,
                                                ).getUser!.id!,
                                              ),
                                            ),);
                              },
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                                decoration: BoxDecoration(border: Border.all()),
                                child: Text(
                                  '${widget.product.qty}',
                                  style: textStyleAnybodyRegular18,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (widget.product.qty! <
                                    pro!.product_item!.qty_in_stock!) {
                                  UpdateProductInCart(
                                    Provider.of<UserProvider>(
                                      context,
                                      listen: false,
                                    ).getUser!.id!,
                                    pro,
                                    1,
                                  ).then(
                                    (final value) =>
                                        context.read<UserBloc>().add(
                                              GetUserById2(
                                                Provider.of<UserProvider>(
                                                  context,
                                                  listen: false,
                                                ).getUser!.id!,
                                              ),
                                            ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      showCloseIcon: true,
                                      duration: const Duration(seconds: 1),
                                      content: Text(
                                          'Đã cập nhật số lượng ${pro.name}',),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const FaIcon(FontAwesomeIcons.plus),
                              ),
                            ),
                          ],
                        );
                      }
                      return Container();
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}

Future<void> deleteProductInCart(final int cartId) async {
  try {
    final res = await Dio().delete(
      '${EndPoints.baseUrl}shopping_cart/user/$cartId',
    );
    log(res.data['message']);
    throw Exception(res.data['message']);
  } catch (e) {
    rethrow;
  }
}

Future<ShoppingCartItems?> UpdateProductInCart(
  final int userId,
  final ProductEntity pro,
  final int qty,
) async {
  try {
    final res = await Dio().post(
      '${EndPoints.baseUrl}shopping_cart/user',
      data: {
        'cart_id': userId,
        'product_item_id': pro.id,
        'qty': qty,
        'product_image': pro.product_image,
      },
    );
    log('Thêm thành công');
    final result = ShoppingCartItems.fromJson(res.data);
    return result;
  } catch (e) {
    log('Lỗi khi thêm sản phẩm vào giỏ: $e');
    return null;
  }
}
