import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/format_number.dart';
import '../../../../config/image.dart';
import '../../../../config/textStyle.dart';
import '../../../../network/end_points.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../../shopcartpage/presentation/view/shop_cart_screen.dart';

class CateGridItem extends StatelessWidget {
  CateGridItem({super.key, required this.pro});
  ProductEntity pro;
  /* String priceWithoutDiacritics(final String price) {
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
  } */

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (final context) => ShopCartScreen(sCart: pro),)),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black87),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(
            imageUrl: pro.product_image![0] == 'i'
                ? '${EndPoints.urlImage}${pro.product_image}'
                : pro.product_image!,
            imageBuilder: (final context, final imageProvider) {
              return Container(
                width: MediaQuery.of(context).size.width / 2,
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
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.08)),
                  child: const CupertinoActivityIndicator(),
                ),
              );
            },
            errorWidget: (final context, final url, final error) {
              return Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                color: Colors.black.withOpacity(0.04),
              );
            },
          ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,10,0),
              child: Text(
                pro.name!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,10,0),
              child: Text(
                CurrencyFormatter().formatNumber(pro.product_item!.price!),
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,10,0),
              child: Row(
                children: [
                  Text(
                    CurrencyFormatter().formatNumber(pro.product_item!.price!),
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  /* Container(
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
                  ), */
                ],
              ),
            ),
            /* ElevatedButton(
              style: ButtonStyle(
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),),
              onPressed: () {
              
            }, child: const Text('Mua ngay'),), */
          ],
        ),
      ),
    );
  }
}
