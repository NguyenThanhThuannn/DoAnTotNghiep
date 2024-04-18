import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import '../../data/models/footer_models_response.dart';

class FooterCustom extends StatefulWidget {
  const FooterCustom({super.key});

  @override
  State<FooterCustom> createState() => _FooterCustomState();
}

class _FooterCustomState extends State<FooterCustom> {
  List<FooterItemModel> footer = [
    FooterItemModel(title: 'Free Delivery', subtitle: r'From $50 and up '),
    FooterItemModel(title: 'SupportCustomer', subtitle: 'Always 24/7'),
    FooterItemModel(title: 'Secure Payments', subtitle: 'Safe shopping'),
    FooterItemModel(title: 'Discount', subtitle: 'From 10%'),
    FooterItemModel(title: 'Cashback', subtitle: 'Buy online'),
    FooterItemModel(title: 'Bonus', subtitle: 'Daily deals'),
  ];

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.5,
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (final context, final index) {
                final int firstIndex = index * 2;
                final int secondIndex = index * 2 + 1;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    footerItem(f: footer[firstIndex]),
                    if (secondIndex < footer.length)
                      footerItem(f: footer[secondIndex]),
                  ],
                );
              },
              separatorBuilder: (final context, final index) {
                return const Divider(
                  color: Colors.grey,
                );
              },
              itemCount: (footer.length / 2).ceil(),
            ),
            /* GridView.builder(
              //physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: footer.length,
              itemBuilder: (final context, final index) {
                return footerItem(f: footer[index]);
              },
            ), */
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(240, 239, 239, 1),
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Get the latest deals and more',
                  style: textStyleInterMedium14,
                ),
                Text(
                  'Subscribe our newsletter and get discount 30% off',
                  style: GoogleFonts.inter(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,),
                      hintText: 'Enter your email address',
                      filled: true,
                      fillColor: Colors.white,
                    ),
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

class footerItem extends StatelessWidget {
  footerItem({super.key, required this.f});
  FooterItemModel f;
  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 9,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Icon(
            Icons.call_end_sharp,
            size: 40,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 8,
            width: MediaQuery.of(context).size.width / 2 - 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  f.title,
                  style: textStyleInterSemiBold16,
                ),
                Text(
                  f.subtitle,
                  style: textStyleInterRegular14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
