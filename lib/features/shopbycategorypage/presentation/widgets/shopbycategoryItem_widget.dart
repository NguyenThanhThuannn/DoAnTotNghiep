import 'package:flutter/material.dart';

import '../../../../config/textStyle.dart';

class ShopByCategoryItem extends StatelessWidget {
  ShopByCategoryItem({super.key, required this.name});
  String name;
  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.width / 2.8,
          color: Colors.amber,
        ),
        Text(name,style: textStylePlusJakartaSansMedium14,),
      ],
    );
  }
}