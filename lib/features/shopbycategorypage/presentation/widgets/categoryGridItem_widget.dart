import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import '../../../homepage/domain/entities/product.dart';

class CateGridItem extends StatelessWidget {
  CateGridItem({super.key, required this.pro});
  ProductEntity pro;
  String priceWithoutDiacritics(final String price) {
    // Loại bỏ dấu "."
    final String priceWithoutDot = price.replaceAll(',', '');

    // Loại bỏ "Đ" hoặc "đ"
    final String priceWithoutD =
        priceWithoutDot.replaceAll('Đ', '').replaceAll('đ', '');

    return priceWithoutD;
  }

  int calculateDiscountPercentage(final int price, final int priceSale) {
    if (price == 0 || priceSale == 0) {
      return 0;
    }
    // Tính phần trăm giảm giá
    final double discountPercentage = ((price - priceSale) / price) * 100;
    // Làm tròn số và trả về phần trăm giảm giá
    return discountPercentage.round();
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: '',
          progressIndicatorBuilder: (final context, final url, final progress) {
            return Padding(
                padding: const EdgeInsetsDirectional.only(end: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.08)),
                    child: const CupertinoActivityIndicator(),
                  ),
                ),);
          },
          errorWidget: (final context, final url, final error) {
            return Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              color: Colors.red,
            );
          },
        ),
        Text(
          pro.title!.length <= 30
              ? pro.title!
              : '${pro.title!.substring(0, 29)}..',
        ),
        Text(
          pro.price_sale!,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Row(
          children: [
            Text(
              pro.price!,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              width: 50,
              alignment: Alignment.center,
              color: Theme.of(context).primaryColor,
              child: Text(
                '${calculateDiscountPercentage(
                  int.parse(priceWithoutDiacritics(pro.price!)),
                  int.parse(priceWithoutDiacritics(pro.price_sale!)),
                )}%',
                style: textStyleKeaniaOne14W,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
