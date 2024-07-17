import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../config/format_number.dart';
import '../../../../config/image.dart';
import '../../../../config/textStyle.dart';
import '../../../../network/end_points.dart';
import '../../../loginregisterpage/data/services/provider.dart';
import '../../../loginregisterpage/presentation/bloc/user_bloc.dart';
import '../../../shopcartpage/presentation/widgets/infoProduct.dart';
import '../../domain/entities/product.dart';

class BestSellingItem extends StatefulWidget {
  BestSellingItem({super.key, required this.pro});
  ProductEntity pro;

  @override
  State<BestSellingItem> createState() => _BestSellingItemState();
}

class _BestSellingItemState extends State<BestSellingItem> {
  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: widget.pro.product_image![0] == 'i'
              ? '${EndPoints.urlImage}${widget.pro.product_image}'
              : widget.pro.product_image!,
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
          progressIndicatorBuilder: (final context, final url, final progress) {
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
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 12),
            width: MediaQuery.of(context).size.width / 1.5,
            height: 140,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: CurrencyFormatter()
                        .formatNumber(widget.pro.product_item!.price!),
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                    children: [
                      TextSpan(
                        text: widget.pro.price,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.pro.name!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: textStyleInterSemiBold16,
                    ),
                  ),
                ),
                RatingBar.builder(
                  ignoreGestures: true,
                  allowHalfRating: true,
                  itemSize: 25,
                  initialRating: widget.pro.product_item!.rating!,
                  itemBuilder: (final context, final index) {
                    return Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                    );
                  },
                  onRatingUpdate: (final value) {},
                ),
                BlocBuilder<UserBloc, UserState>(
                  builder: (final context, final state) {
                    if(state is UserLoading){
                      return const Center(child: CircularProgressIndicator.adaptive(),);
                    }
                    if(state.user!.shopping_cart!.items!.any((final element) => element.product_item_id==widget.pro.id)){
                      final int maxQuanlityCart = state.user!.shopping_cart!.items!.firstWhere((final element) => element.product_item_id==widget.pro.id).qty!;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (widget.pro.product_item!.qty_in_stock! >= 1&&maxQuanlityCart<widget.pro.product_item!.qty_in_stock!) {
                            ProductInCart(
                              Provider.of<UserProvider>(
                                context,
                                listen: false,
                              ).getUser!.id!,
                              widget.pro,
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
                                  content:
                                      const Text('Sản phẩm này đã hết hàng!'),
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
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                                color: Theme.of(context).primaryColor,),
                          ),
                          child: Text(
                            'ADD TO CART',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    );}else{
                      return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (widget.pro.product_item!.qty_in_stock! >= 1) {
                            ProductInCart(
                              Provider.of<UserProvider>(
                                context,
                                listen: false,
                              ).getUser!.id!,
                              widget.pro,
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
                                  content:
                                      const Text('Sản phẩm này đã hết hàng!'),
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
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                                color: Theme.of(context).primaryColor,),
                          ),
                          child: Text(
                            'ADD TO CART',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
