import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../config/format_number.dart';
import '../../../../config/textStyle.dart';
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
          imageUrl: widget.pro.product_image!,
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
                    text: CurrencyFormatter().formatNumber(widget.pro.product_item!.price!),
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
                Text(
                  widget.pro.name!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: textStyleInterSemiBold16,
                ),
                Row(
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
                    Text(
                      '(17 reviews)',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Theme.of(context).primaryColor),
                  ),
                  child: Text(
                    'Add to cart',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
