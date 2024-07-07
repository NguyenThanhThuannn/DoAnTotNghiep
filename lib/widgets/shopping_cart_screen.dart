import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                  Navigator.pop(context);
                },
                child: const Icon(Icons.keyboard_arrow_left_outlined),
              ),
              title: Text(
                'Giỏ hàng',
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
                'Giỏ hàng',
                style: textStylePlusJakartaSansMedium14Height1point5,
              ),
            ),
            body: shoppingCartItems.isNotEmpty
                ? ListView.builder(
                    itemCount: shoppingCartItems.length,
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
                                  content: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    height:
                                        MediaQuery.of(context).size.width / 4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Xóa sản phẩm này?',
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(
                                                  true,
                                                ); // Return true if OK is pressed
                                              },
                                              child: const Text('OK'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(
                                                  false,
                                                ); // Return false if Cancel is pressed
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
                            /* shoppingCartItems.removeAt(index); */

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Xóa sản phẩm thành công}'),
                              ),
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
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (final context) => CheckOutScreen(
                          lstProInCO: shoppingCartItems,
                        ),
                      ),
                    );
                  },
                  child: const Text('Mua hàng'),
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
  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (final context, final state) {
        ProductEntity? pro;
        pro = state.products!.firstWhere(
          (final element) => element.id == widget.product.product_item_id,
        );
        quanlity = widget.product.qty!;
        return Row(
          children: [
            if (ImageCheck().isBase64Image(pro.product_image!))
              Image.memory(
                ImageCheck().base64ToImage(pro.product_image!),
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 2,
                fit: BoxFit.contain,
              )
            else
              CachedNetworkImage(
                imageUrl: pro.product_image!,
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
                      CurrencyFormatter().formatNumber(pro.product_item!.price!),
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (quanlity > 1) {
                            quanlity--;
                            UpdateProductInCart(
                              Provider.of<UserProvider>(
                                context,
                                listen: false,
                              ).getUser!.id!,
                              pro!,
                              -1,
                            ).then(
                              (final value) => context.read<UserBloc>().add(
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
                                content:
                                    Text('Đã cập nhật số lượng ${pro.name}'),
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
                            deleteProductInCart(widget.product.id!);
                            context.read<UserBloc>().add(
                                    GetUserById2(
                                      Provider.of<UserProvider>(
                                        context,
                                        listen: false,
                                      ).getUser!.id!,
                                    ),
                                  );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                showCloseIcon: true,
                                duration: const Duration(seconds: 1),
                                content: Text('Đã xóa ${pro!.name}'),
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
                          child: const FaIcon(FontAwesomeIcons.minus),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          '$quanlity',
                          style: textStyleInterMedium18,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (quanlity < pro!.product_item!.qty_in_stock!) {
                            quanlity++;
                            UpdateProductInCart(
                              Provider.of<UserProvider>(
                                context,
                                listen: false,
                              ).getUser!.id!,
                              pro,
                              1,
                            ).then(
                              (final value) => context.read<UserBloc>().add(
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
                                content:
                                    Text('Đã cập nhật số lượng ${pro.name}'),
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
                  ),
                ],
              ),
            ),
          ],
        );
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
