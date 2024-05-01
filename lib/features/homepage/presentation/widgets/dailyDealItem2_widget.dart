import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import '../../domain/entities/product.dart';

// ignore: must_be_immutable
class DailyDealItem2 extends StatelessWidget {
  DailyDealItem2({super.key, required this.pro});
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
        Text(
          pro.price!,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.5,
          child: Text(
            pro.title!,
            softWrap: true,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: textStyleInterMedium14,
          ),
        ),
      ],
    );
  }
}
Positioned _buildSwitchCaseTag(final BuildContext context, final String? tag) {
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
        child: tag!=null? Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          color: Colors.yellow,
          child: Text(
            tag,
            style: textStyleKeaniaOne14W,
          ),
        ):const SizedBox(),
      );
  }
}
