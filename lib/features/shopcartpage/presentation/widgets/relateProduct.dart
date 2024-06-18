/* import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import '../../../homepage/data/models/product_models_response.dart' as sCart;
import '../../../homepage/domain/entities/product.dart';
import '../../data/models/shop_cart_response_model.dart';

class RelateProduct extends StatefulWidget {
  RelateProduct({super.key, required this.sCart});
  ProductEntity sCart;

  @override
  State<RelateProduct> createState() => _RelateProductState();
}

class _RelateProductState extends State<RelateProduct> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(final BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 1.5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Related ',
                    style: textStyleInterSemiBold16,
                    children: [
                      TextSpan(
                        text: 'Products',
                        style: textStyleInterRegular16,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_currentPage > 0) {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          }
                        });
                      },
                      child: const Icon(Icons.keyboard_arrow_left_outlined),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_currentPage < widget.sCart.relatePro!.length) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          }
                        });
                      },
                      child: const Icon(Icons.keyboard_arrow_right_outlined),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: PageView.builder(
              onPageChanged: (final value) {
                setState(() {
                  _currentPage = value;
                });
              },
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: (widget.sCart.relatePro!.length / 6).ceil(),
              itemBuilder: (final context, final index) {
                final int startIndex = index * 6;
                final int endIndex = startIndex + 6;
                final products = widget.sCart.relatePro!.sublist(
                  startIndex,
                  endIndex < widget.sCart.relatePro!.length
                      ? endIndex
                      : widget.sCart.relatePro!.length,
                );
                return GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  children: products
                      .map((final product) => relateProductItem(pro: product))
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class relateProductItem extends StatelessWidget {
  relateProductItem({super.key, required this.pro});
  ProductEntity pro;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.5 - 20,
              height: 85,
              color: Colors.amber,
            ),
            _buildSwitchCaseTag(context, pro.tag),
          ],
        ),
        if (pro.price_sale != null)
          Text.rich(
            TextSpan(
              text: pro.price_sale,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
              ),
              children: [
                TextSpan(
                  text: pro.price,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          )
        else
          Text(
            pro.price!,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Text(
            pro.title!,
            softWrap: true,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildSwitchCaseTag(final BuildContext context, final String? tag) {
  switch (tag) {
    case 'SALE':
      return Positioned(
        right: 0,
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          color: Colors.greenAccent[400],
          child: Text(
            'SALE',
            style: textStyleKeaniaOne14W,
          ),
        ),
      );
    case 'HOT':
      return Positioned(
        right: 0,
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          color: Colors.red,
          child: Text(
            'HOT',
            style: textStyleKeaniaOne14W,
          ),
        ),
      );
    case 'NEW':
      return Positioned(
        right: 0,
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          color: Theme.of(context).primaryColor,
          child: Text(
            'NEW',
            style: textStyleKeaniaOne14W,
          ),
        ),
      );
    default:
      return Positioned(
        right: 0,
        child: tag != null
            ? Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                color: Colors.yellow,
                child: Text(
                  tag,
                  style: textStyleKeaniaOne14W,
                ),
              )
            : const SizedBox(),
      );
  }
}
 */