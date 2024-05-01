import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        Container(
          width: 150,
          height: 140,
          color: Colors.white,
        ),
        Container(
          padding: const EdgeInsets.only(left: 12),
          width: MediaQuery.of(context).size.width / 2,
          height: 140,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: widget.pro.price_sale,
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
              SizedBox(
                width: 136,
                child: Text(
                  widget.pro.title!.length <= 30
                      ? widget.pro.title!
                      : widget.pro.title!.substring(0, 30) + '...',
                  softWrap: true,
                ),
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
      ],
    );
  }
}
