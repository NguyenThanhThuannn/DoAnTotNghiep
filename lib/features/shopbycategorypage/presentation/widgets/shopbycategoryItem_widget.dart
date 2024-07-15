import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/constaint.dart';
import '../../../../config/textStyle.dart';
import '../../../../network/end_points.dart';
import '../../../homepage/presentation/bloc/home_page_bloc.dart';
import '../../domain/entities/category.dart';
import 'shimmer_widget.dart';

class ShopByCategoryItem extends StatelessWidget {
  ShopByCategoryItem({super.key, required this.cate});
  CategoryEntity cate;
  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<HomePageBloc, HomePageState>(
          builder: (final context, final state) {
            if (state is HomePageLoading) {
              return const Shimmer();
            }
            if (state is HomePageLoaded) {
              if(state.products!.any((final element) => element.category_id==cate.parent_category_id)) {
                return CachedNetworkImage(
                imageUrl: state.products!.isNotEmpty &&
                        state.products!
                                .firstWhere(
                                  (final element) =>
                                      element.category_id ==
                                      cate.parent_category_id,
                                )
                                .product_image![0] ==
                            'i'
                    ? '${EndPoints.urlImage}${state.products!.firstWhere(
                          (final element) =>
                              element.category_id == cate.parent_category_id,
                        ).product_image!}'
                    : state.products!
                        .firstWhere(
                          (final element) =>
                              element.category_id == cate.parent_category_id,
                        )
                        .product_image!,
                imageBuilder: (final context, final imageProvider) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
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
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.width / 2.5,
                    color: Colors.black.withOpacity(0.04),
                  );
                },
              );
              }else{
                return CachedNetworkImage(
                imageUrl: '',
                imageBuilder: (final context, final imageProvider) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
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
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.width / 2.5,
                    color: Colors.black.withOpacity(0.04),
                  );
                },
              );
              }
            }
            return Container();
          },
        ),
        Text(
          cate.category_name!,
          style: textStylePlusJakartaSansMedium14,
        ),
      ],
    );
  }
}
