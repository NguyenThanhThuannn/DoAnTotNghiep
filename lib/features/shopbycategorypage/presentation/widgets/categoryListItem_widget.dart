import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../config/constaint.dart';
import '../../../../config/format_number.dart';
import '../../../../config/textStyle.dart';
import '../../../../network/api_provider.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../../loginregisterpage/data/services/provider.dart';
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
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 2.5 + 10,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black87),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: pro.product_image!,
              imageBuilder: (final context, final imageProvider) {
                return Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.width / 2.5 + 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8)),
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
                  height: MediaQuery.of(context).size.width / 2.5 + 10,
                  color: Colors.black.withOpacity(0.04),
                );
              },
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
              width: MediaQuery.of(context).size.width / 2 + 10,
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: Colors.black87)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5 - 50,
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
                  Text(
                    CurrencyFormatter().formatNumber(pro.product_item!.price!),
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        ignoreGestures: true,
                        minRating: 1,
                        initialRating: 4.5,
                        allowHalfRating: true,
                        itemSize: 24,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (final context, final index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (final rating) {},
                      ),
                      Text(
                        '4.9/5',
                        style: textStyleInterMedium14,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor,
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      /* final res = await ApiProvider().postRequest('endpoint',body: {
                        'user_id':UserProvider().user!.id,
                        'product_id':pro.id
                      }); */
                    },
                    child: const Text('Mua ngay'),
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
