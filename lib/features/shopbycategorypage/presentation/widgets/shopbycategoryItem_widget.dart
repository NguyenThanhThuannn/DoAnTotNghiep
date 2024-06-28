import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../config/constaint.dart';
import '../../../../config/textStyle.dart';
import '../../domain/entities/category.dart';

class ShopByCategoryItem extends StatelessWidget {
  ShopByCategoryItem({super.key, required this.cate});
  CategoryEntity cate;
  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: kDefaultImage,
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
        ),
        Text(cate.category_name!,style: textStylePlusJakartaSansMedium14,),
      ],
    );
  }
}