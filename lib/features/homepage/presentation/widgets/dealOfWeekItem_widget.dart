import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../config/format_number.dart';
import '../../../../config/textStyle.dart';
import '../../domain/entities/product.dart';

// ignore: must_be_immutable
class DealOfWeekItem extends StatelessWidget {
  DealOfWeekItem({super.key, required this.pro});
  ProductEntity pro;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
            ),
            CachedNetworkImage(
              imageUrl: pro.product_image!,
              imageBuilder: (final context, final imageProvider) {
                return Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    color: Colors.black.withOpacity(0.04),
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
            Positioned(
              top: 0,
              right: 40,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 5.5,
                height: MediaQuery.of(context).size.width / 5.5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Color.fromRGBO(94, 207, 84, 1),
                ),
                child: Text(
                  'Tiết kiệm 2,470,803Đ',
                  style: textStyleInterSemiBold12W,
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        Text.rich(
          TextSpan(
            text: CurrencyFormatter().formatNumber(pro.product_item!.price!),
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
            children: [
              TextSpan(
                text: pro.price,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ),
        Text(
          pro.name!,
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: textStyleInterMedium14,
        ),
        const SizedBox(
          height: 65,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: 'Còn hàng: ',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(
                    text: pro.product_item!.qty_in_stock.toString(),
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(47, 255, 29, 1),
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Đã bán: ',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(
                    text: pro.product_item!.SKU.toString(),
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 15),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
              ),
              Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width / 10,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(47, 255, 29, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}
