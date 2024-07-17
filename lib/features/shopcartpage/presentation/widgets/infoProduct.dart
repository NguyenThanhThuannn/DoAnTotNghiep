import 'dart:developer';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import '../../../../config/format_number.dart';
import '../../../../config/textStyle.dart';
import '../../../../network/api.dart';
import '../../../../network/api_provider.dart';
import '../../../../network/end_points.dart';
import '../../../favoritepage/domain/favourite.dart';
import '../../../favoritepage/presentation/bloc/favourite_bloc.dart';
import '../../../favoritepage/presentation/view/favourite_screen.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../../loginregisterpage/data/model/user_model.dart';
import '../../../loginregisterpage/data/services/provider.dart';
import '../../../loginregisterpage/presentation/bloc/user_bloc.dart';
import '../../data/models/shop_cart_response_model.dart';
import 'colorDropDown_widget.dart';

class InfoProduct extends StatefulWidget {
  InfoProduct({super.key, required this.sCart});
  ProductEntity sCart;

  @override
  State<InfoProduct> createState() => _InfoProductState();
}

class _InfoProductState extends State<InfoProduct> {
  int quanlity = 1;
  int maxQuanlityCart = 1;
  int? isSelectedColor;
  int? isSelectedStorage;
  int? isSelectedSize;
  int? isSelectedMaterial;
  @override
  void initState() {
    super.initState();
    isSelectedColor = 0;
    isSelectedStorage = 0;
    isSelectedSize = 0;
    isSelectedMaterial = 0;
  }

  Color stringToColor(final String colorString) {
    final Map<String, Color> colorMap = {
      'red': Colors.red,
      'blue': Colors.blue,
      'green': Colors.green,
      'yellow': Colors.yellow,
      'orange': Colors.orange,
      'purple': Colors.purple,
      'black': Colors.black,
      'white': Colors.white,
      // Thêm các màu khác nếu cần
    };

    return colorMap[colorString.toLowerCase()] ??
        Colors.transparent; // Trả về màu trong suốt nếu không tìm thấy màu
  }

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  widget.sCart.category!.category_name!,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              /* SizedBox(
                width: MediaQuery.of(context).size.width / 3.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (widget.sCart.tag != null)
                      _buildSwitchCaseTag(context, widget.sCart.tag)
                    else
                      const SizedBox(),
                    _buildSwitchCaseTag(context, 'SALE'),
                  ],
                ),
              ), */
            ],
          ),
          Text(
            widget.sCart.name!,
            style: textStyleInterSemiBold18,
            maxLines: 2,
            softWrap: true,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /* Text.rich(
                    TextSpan(
                      text: '${widget.sCart.price_sale}   ',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: widget.sCart.price,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ) */
                Text(
                  CurrencyFormatter()
                      .formatNumber(widget.sCart.product_item!.price!),
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'AVAILABLE: ',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(
                        text: widget.sCart.product_item!.SKU! <
                                widget.sCart.product_item!.qty_in_stock!
                            ? 'YES'
                            : 'NO',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: widget.sCart.product_item!.SKU! <
                                  widget.sCart.product_item!.qty_in_stock!
                              ? const Color.fromRGBO(47, 255, 29, 1)
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: /* Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Color.fromRGBO(245, 236, 11, 1),
                ),
                const Icon(
                  Icons.star,
                  color: Color.fromRGBO(245, 236, 11, 1),
                ),
                const Icon(
                  Icons.star,
                  color: Color.fromRGBO(245, 236, 11, 1),
                ),
                const Icon(
                  Icons.star,
                  color: Color.fromRGBO(245, 236, 11, 1),
                ),
                const Icon(
                  Icons.star_half,
                  color: Color.fromRGBO(245, 236, 11, 1),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '(Based on 5 reviews)',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ],
            ), */
                RatingBar.builder(
              allowHalfRating: true,
              ignoreGestures: true,
              itemSize: 30,
              initialRating: widget.sCart.product_item!.rating!,
              itemBuilder: (final context, final index) {
                return Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                );
              },
              onRatingUpdate: (final value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpandableText(
              widget.sCart.description!,
              readMoreText: 'Read more',
              readLessText: 'Read less',
              trim: 5,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          /* Container(
            margin: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 4.5,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.sCart.subDesItem!.length,
              itemBuilder: (final context, final index) {
                return Text(
                  widget.sCart.subDesItem![index].item,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ), */
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: 'ID: ',
                  style: textStyleInterSemiBold14,
                  children: [
                    TextSpan(
                      text: widget.sCart.id.toString(),
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'QTY',
                        style: textStyleInterSemiBold14,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.width / 8 + 2,
                        child: quanlity < 10
                            ? Text(
                                '0$quanlity',
                                style: textStyleInterSemiBold14,
                              )
                            : Text(
                                '$quanlity',
                                style: textStyleInterSemiBold14,
                              ),
                      ),
                      /* Container(
                        width: MediaQuery.of(context).size.width / 12,
                        height: MediaQuery.of(context).size.width / 8 + 2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  quanlity <
                                          widget
                                              .sCart.product_item!.qty_in_stock!
                                      ? quanlity++
                                      : null;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (quanlity > 1) quanlity--;
                                });
                              },
                              child: const Icon(
                                Icons.minimize,
                              ),
                            ),
                          ],
                        ),
                      ), */
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      BlocBuilder<FavouriteBloc, FavouriteState>(
                        builder: (final context, final state) {
                          if (state is FavouriteLoading) {
                            return const CircularProgressIndicator.adaptive();
                          }
                          if (state is FavouriteError) {
                            return Text(state.error.toString());
                          }
                          if (state is FavouriteLoaded) {
                            bool? isFav;
                            final matchingItems = state.favourite!.where(
                              (final element) =>
                                  element.product_id!.id == widget.sCart.id,
                            );

                            if (matchingItems.isNotEmpty &&
                                matchingItems.first.is_default == 1) {
                              isFav = true;
                            } else {
                              isFav = false;
                            }
                            return IconButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.grey[300]),
                              ),
                              onPressed: () {
                                UpdateFavourite(
                                  Provider.of<UserProvider>(
                                    context,
                                    listen: false,
                                  ).getUser!.id!,
                                  widget.sCart.id,
                                ).then(
                                  (final value) =>
                                      context.read<FavouriteBloc>().add(
                                            GetFavourites2(
                                              Provider.of<UserProvider>(
                                                context,
                                                listen: false,
                                              ).getUser!.id!,
                                            ),
                                          ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 1),
                                    showCloseIcon: true,
                                    content: Text(
                                      'Sản phẩm đã thêm vào yêu thích',
                                    ),
                                  ),
                                );
                              },
                              icon: isFav
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(Icons.favorite_outline),
                            );
                          }
                          return const SizedBox(
                            width: 1,
                            height: 1,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          /* const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                ColorDropdown(),
              ],
            ),
          ), */
          /* if (widget.sCart.colors!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Màu',
                  style: textStyleInterSemiBold16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 12,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.sCart.colors!.length,
                    itemBuilder: (final context, final index) {
                      log(widget.sCart.colors.toString());
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectedColor = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: MediaQuery.of(context).size.width / 12,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: isSelectedColor == index
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            color: stringToColor(
                              widget.sCart.colors![index].name!,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          else
            const SizedBox(),
          if (widget.sCart.storage!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dung lượng',
                  style: textStyleInterSemiBold16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 12,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.sCart.storage!.length,
                    itemBuilder: (final context, final index) {
                      log(widget.sCart.storage.toString());
                      return widget.sCart.storage![index].inStock!
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectedStorage = index;
                                });
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3 -
                                            (widget.sCart.storage!.length * 5),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: isSelectedStorage == index
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      widget.sCart.storage![index].name!,
                                    ),
                                  ),
                                  if (isSelectedStorage == index)
                                    Positioned(
                                      top: -3,
                                      right: 2,
                                      child: Icon(
                                        Icons.check_box,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                ],
                              ),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width / 3 -
                                  (widget.sCart.storage!.length * 5),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelectedStorage == index
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: Text(
                                widget.sCart.storage![index].name!,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            );
                    },
                  ),
                ),
              ],
            )
          else
            const SizedBox(),
          if (widget.sCart.sizes!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kích thước',
                  style: textStyleInterSemiBold16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 12,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.sCart.sizes!.length,
                    itemBuilder: (final context, final index) {
                      log(widget.sCart.sizes.toString());
                      return widget.sCart.sizes![index].inStock!
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectedSize = index;
                                });
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3 -
                                            (widget.sCart.sizes!.length * 5),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: isSelectedSize == index
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child:
                                        Text(widget.sCart.sizes![index].name!),
                                  ),
                                  if (isSelectedSize == index)
                                    Positioned(
                                      top: -3,
                                      right: 2,
                                      child: Icon(
                                        Icons.check_box,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                ],
                              ),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width / 3 -
                                  (widget.sCart.storage!.length * 5),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelectedSize == index
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: Text(
                                widget.sCart.sizes![index].name!,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            );
                    },
                  ),
                ),
              ],
            )
          else
            const SizedBox(),
          if (widget.sCart.material!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Loại',
                  style: textStyleInterSemiBold16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 12,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.sCart.material!.length,
                    itemBuilder: (final context, final index) {
                      log(widget.sCart.material.toString());
                      return widget.sCart.material![index].inStock!
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectedMaterial = index;
                                });
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3 -
                                            (widget.sCart.material!.length * 5),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: isSelectedMaterial == index
                                            ? Theme.of(context).primaryColor
                                            : Colors.grey,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      widget.sCart.material![index].name!,
                                    ),
                                  ),
                                  if (isSelectedMaterial == index)
                                    Positioned(
                                      top: -3,
                                      right: 2,
                                      child: Icon(
                                        Icons.check_box,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                ],
                              ),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width / 3 -
                                  (widget.sCart.material!.length * 5),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelectedMaterial == index
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: Text(
                                widget.sCart.material![index].name!,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            );
                    },
                  ),
                ),
              ],
            )
          else
            const SizedBox(), */
          BlocBuilder<UserBloc, UserState>(
            builder: (final context, final state) {
              if (state is UserLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (state is UserLoaded) {
                log('ID ${widget.sCart.id!}');
                if(state.user!.shopping_cart!.items!.any((final element) => element.product_item_id==widget.sCart.id!)){
                  maxQuanlityCart=state.user!.shopping_cart!.items!.firstWhere((final element) => element.product_item_id==widget.sCart.id!).qty!;
                  return Visibility(
                  visible: widget.sCart.product_item!.SKU! <
                          widget.sCart.product_item!
                              .qty_in_stock! 
                      ? true
                      : false,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 15,
                      right: 15,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                          ),
                          onPressed: () {
                            /* context.read<UserBloc>().add(AddProduct(Provider.of<UserProvider>(
                              context,
                              listen: false,
                            ).getUser!.id!,
                            widget.sCart,
                            quanlity,),); */

                            if (maxQuanlityCart <
                                widget.sCart.product_item!.qty_in_stock!) {
                              ProductInCart(
                                Provider.of<UserProvider>(
                                  context,
                                  listen: false,
                                ).getUser!.id!,
                                widget.sCart,
                                quanlity,
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
                              showDialog(
                                context: context,
                                builder: (final BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Thông báo'),
                                    content:
                                        const Text('Sản phẩm đã thêm vào giỏ!'),
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
                            } else {
                              showDialog(
                                context: context,
                                builder: (final BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Thông báo'),
                                    content: const Text(
                                      'Số lượng tồn của sản phẩm đã hết',
                                    ),
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
                            }
                          },
                          child: Text(
                            'ADD TO CART',
                            style: textStyleInterMedium14W,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                }
                else {
                  return Visibility(
                  visible: widget.sCart.product_item!.SKU! <
                          widget.sCart.product_item!
                              .qty_in_stock! 
                      ? true
                      : false,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 15,
                      right: 15,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                          ),
                          onPressed: () {
                            /* context.read<UserBloc>().add(AddProduct(Provider.of<UserProvider>(
                              context,
                              listen: false,
                            ).getUser!.id!,
                            widget.sCart,
                            quanlity,),); */

                            if (maxQuanlityCart <
                                widget.sCart.product_item!.qty_in_stock!) {
                              ProductInCart(
                                Provider.of<UserProvider>(
                                  context,
                                  listen: false,
                                ).getUser!.id!,
                                widget.sCart,
                                quanlity,
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
                              showDialog(
                                context: context,
                                builder: (final BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Thông báo'),
                                    content:
                                        const Text('Sản phẩm đã thêm vào giỏ!'),
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
                            } else {
                              showDialog(
                                context: context,
                                builder: (final BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Thông báo'),
                                    content: const Text(
                                      'Số lượng tồn của sản phẩm đã hết',
                                    ),
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
                            }
                          },
                          child: Text(
                            'ADD TO CART',
                            style: textStyleInterMedium14W,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                }
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildSwitchCaseTag(final BuildContext context, final String? tag) {
  switch (tag) {
    case 'SALE':
      return Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        color: Colors.greenAccent[400],
        child: Text(
          'SALE',
          style: textStyleKeaniaOne14W,
        ),
      );
    case 'HOT':
      return Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        color: Colors.red,
        child: Text(
          'HOT',
          style: textStyleKeaniaOne14W,
        ),
      );
    case 'NEW':
      return Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        color: Theme.of(context).primaryColor,
        child: Text(
          'NEW',
          style: textStyleKeaniaOne14W,
        ),
      );
    default:
      return Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        color: Colors.yellow,
        child: Text(
          tag!,
          style: textStyleKeaniaOne14,
        ),
      );
  }
}

Future<ShoppingCartItems?> ProductInCart(
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
