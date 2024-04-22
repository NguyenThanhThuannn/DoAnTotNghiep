import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import '../../data/models/shop_cart_response_model.dart';

class BundleItem extends StatefulWidget {
  BundleItem({super.key, required this.pro, required this.total});
  Product pro;
  ValueNotifier<int> total;

  @override
  State<BundleItem> createState() => _BundleItemState();
}

class _BundleItemState extends State<BundleItem> {
  late bool isChecked;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isChecked=false;
  }
  String priceWithoutDiacritics(final String price) {
    // Loại bỏ dấu "."
    final String priceWithoutDot = price.replaceAll('.', '');

    // Loại bỏ "Đ" hoặc "đ"
    final String priceWithoutD =
        priceWithoutDot.replaceAll('Đ', '').replaceAll('đ', '');

    return priceWithoutD;
  }

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.width / 4,
            color: Colors.amberAccent,
          ),
          Text(widget.pro.price,style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),),
          Text(
            widget.pro.title,
            maxLines: 2,
            softWrap: true,
            textAlign: TextAlign.center,
            style: textStyleInterSemiBold14,
          ),
          Column(
            children: [
              Checkbox(
                fillColor: MaterialStatePropertyAll(
                  isChecked ? Theme.of(context).primaryColor : null,
                ),
                value: isChecked,
                onChanged: (final _) {
                  setState(() {
                    isChecked = !isChecked;
                    if (isChecked) {
                      widget.total.value +=
                          int.parse(priceWithoutDiacritics(widget.pro.price));
                    } else {
                      widget.total.value -=
                          int.parse(priceWithoutDiacritics(widget.pro.price));
                    }
                  });
                },
              ),
              Text(isChecked ? 'Selected' : 'Select', style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),),
            ],
          ),
        ],
      ),
    );
  }
}