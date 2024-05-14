import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../data/models/shop_cart_response_model.dart';
import 'colorDropDown_widget.dart';

class InfoProduct extends StatefulWidget {
  InfoProduct({super.key, required this.sCart});
  ProductEntity sCart;

  @override
  State<InfoProduct> createState() => _InfoProductState();
}

class _InfoProductState extends State<InfoProduct> {
  int quanlity = 1;
  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.sCart.type!,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(8, 211, 255, 1),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (widget.sCart.tag != null)
                      _buildSwitchCaseTag(context, widget.sCart.tag)
                    else
                      const SizedBox(),
                    _buildSwitchCaseTag(context, 'SALE'),
                  ],
                ),
              ),
            ],
          ),
          Text(
            widget.sCart.title!,
            style: textStyleInterSemiBold16,
            maxLines: 2,
            softWrap: true,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.sCart.price_sale!.isNotEmpty)
                  Text.rich(
                    TextSpan(
                      text: '${widget.sCart.price_sale}   ',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: widget.sCart.price,
                          style: GoogleFonts.inter(
                            fontSize: 16,
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
                    widget.sCart.price!,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                Text.rich(
                  TextSpan(
                    text: 'Available: ',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(
                        text: widget.sCart.status! ? 'CÒN HÀNG' : 'HẾT HÀNG',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: widget.sCart.status!
                              ? const Color.fromRGBO(47, 255, 29, 1)
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
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
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '(Based on 5 reviews)',
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
            widget.sCart.description!,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 4.5,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.sCart.subDesItem!.length,
              itemBuilder: (final context, final index) {
                return Text(
                  widget.sCart.subDesItem![index].item,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  text: 'SKU: ',
                  style: textStyleInterSemiBold14,
                  children: [
                    TextSpan(
                      text: widget.sCart.SKU,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'QTY',
                        style: textStyleInterSemiBold14,
                        ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.width / 8 + 2,
                        child: quanlity < 10
                            ? Text('0$quanlity', style: textStyleInterSemiBold14)
                            : Text('$quanlity', style: textStyleInterSemiBold14),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 12,
                        height: MediaQuery.of(context).size.width / 8 + 2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  quanlity++;
                                });
                              },
                              child:
                                  const Icon(Icons.keyboard_arrow_up_outlined),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (quanlity > 1) quanlity--;
                                });
                              },
                              child: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey[300]),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border_outlined),
                      ),
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey[300]),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.compare_arrows_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                ColorDropdown(),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Thêm vào giỏ hàng',
                    style: textStyleInterMedium14W,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Mua ngay',
                    style: textStyleInterMedium14W,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildSwitchCaseTag(final BuildContext context, final String? tag) {
  switch (tag) {
    case 'SALE':
      return Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        color: Colors.greenAccent[400],
        child: Text(
          'SALE',
          style: textStyleKeaniaOne14W,
        ),
      );
    case 'HOT':
      return Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        color: Colors.red,
        child: Text(
          'HOT',
          style: textStyleKeaniaOne14W,
        ),
      );
    case 'NEW':
      return Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        color: Theme.of(context).primaryColor,
        child: Text(
          'NEW',
          style: textStyleKeaniaOne14W,
        ),
      );
    default:
      return Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        color: Colors.yellow,
        child: Text(
          tag!,
          style: textStyleKeaniaOne14,
        ),
      );
  }
}