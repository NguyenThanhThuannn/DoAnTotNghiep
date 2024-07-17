import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      height: MediaQuery.of(context).size.width/1.6,
      child: Column(
        children: [
          /* SizedBox(
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
          ), */
          Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  FaIcon(
                    FontAwesomeIcons.truckFast,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Free Delivery',
                        style: textStyleInterSemiBold14,
                      ),
                      Text(
                        r'From $50 and up ',
                        style: textStyleInterRegular14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FaIcon(
                    FontAwesomeIcons.headset,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Support Customer',
                        style: textStyleInterSemiBold14,
                      ),
                      Text(
                        'Always 24/7',
                        style: textStyleInterRegular14,
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  FaIcon(
                    FontAwesomeIcons.shield,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Secure Payments',
                        style: textStyleInterSemiBold14,
                      ),
                      Text(
                        'Safe shopping',
                        style: textStyleInterRegular14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FaIcon(
                    FontAwesomeIcons.idBadge,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Discount',
                        style: textStyleInterSemiBold14,
                      ),
                      Text(
                        'From 10%',
                        style: textStyleInterRegular14,
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  FaIcon(
                    FontAwesomeIcons.dollarSign,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cashback',
                        style: textStyleInterSemiBold14,
                      ),
                      Text(
                        'Buy online',
                        style: textStyleInterRegular14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  FaIcon(
                    FontAwesomeIcons.gift,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bonus',
                        style: textStyleInterSemiBold14,
                      ),
                      Text(
                        'Daily deals',
                        style: textStyleInterRegular14,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50,),
            ],
          ),
          /* Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      'Get the latest deals and more',
                      style: textStyleInterMedium14,
                    ),
                  ),
                  Text(
                    'Subscribe our newsletter and get discount 30% off',
                    style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const TextField(
                      decoration: InputDecoration(
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Enter your email address',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ), */
        ],
      ),
    );
  }
}