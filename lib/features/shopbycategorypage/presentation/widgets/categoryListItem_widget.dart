/* import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../homepage/domain/entities/product.dart';
import '../../../shopcartpage/presentation/view/shop_cart_screen.dart';

class CateListItem extends StatelessWidget {
  CateListItem({super.key, required this.pro});
  ProductEntity pro;

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (final context) => ShopCartScreen(sCart: pro),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 3,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8),
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 3,
              color: Colors.amber,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5 - 50,
                    child: Text(
                      pro.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    pro.price!,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
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
                        '(${pro.review})',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 */