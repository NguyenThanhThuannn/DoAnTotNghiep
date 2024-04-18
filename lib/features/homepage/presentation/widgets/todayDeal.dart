import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import '../../data/models/product_models_response.dart';
import 'dailyDealItemTab_widget.dart';

class TodayDeal extends StatefulWidget {
  const TodayDeal({super.key});

  @override
  State<TodayDeal> createState() => _TodayDealState();
}

class _TodayDealState extends State<TodayDeal> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;
  int selectedIndex = 0;
  List<String> tab = ['TV & Audio', 'Computers & Laptops', 'Cameras & Photos'];
  List<Product> pro = [
    Product(
      price: '14,190,000Đ',
      title: 'TV SamSung 65’’ QAQ65Q70B QLED Smart 4K',
      review: 17,
    ),
    Product(
      price: '12,800,000Đ',
      title: 'TV SamSung 65’’ 65Q65A QLED Smart 4KK',
      review: 25,
    ),
    Product(
      price: '12,800,000Đ',
      title: 'TV SamSung 65’’ 65Q65A QLED Smart 4K',
      review: 17,
    ),
    Product(
      price: '14,190,000Đ',
      title: 'TV SamSung 65’’ QAQ65Q70B QLED Smart 4K',
      review: 17,
    ),
    Product(
      price: '12,800,000Đ',
      title: 'TV SamSung 65’’ 65Q65A QLED Smart 4K',
      review: 17,
    ),
    Product(
      price: '14,190,000Đ',
      title: 'TV SamSung 65’’ QAQ65Q70B QLED Smart 4K',
      review: 17,
    ),
  ];

  @override
  Widget build(final BuildContext context) {
    return Container(
      color: Colors.grey[200],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 10),
            child: Text.rich(
              TextSpan(
                text: "Today's ",
                style: textStyleInterSemiBold16,
                children: [
                  TextSpan(
                    text: 'Deal',
                    style: textStyleInterRegular16,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 7,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tab.length,
              itemBuilder: (final context, final index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 30, 10),
                    child: ItemTab(
                      name: tab[index],
                      isSelected: selectedIndex == index,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2.5-40,
            child: PageView.builder(
              itemCount: (pro.length / 2).ceil(),
              itemBuilder: (final context, final index) {
                final int firstIndex = index * 2;
                final int secondIndex = index * 2 + 1;
                return SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      todayDealItem(pro: pro[firstIndex]),
                      if (secondIndex < pro.length)
                        todayDealItem(pro: pro[secondIndex]),
                    ],
                  ),
                );
              },
              controller: _pageController,
              onPageChanged: (final index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate((pro.length/2).ceil(), (final index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(25),
                    color: _currentPage == index
                        ? Theme.of(context).primaryColor
                        : null,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class todayDealItem extends StatelessWidget {
  todayDealItem({super.key, required this.pro});
  Product pro;

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 3,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: MediaQuery.of(context).size.width / 3.5,
            color: Colors.orange,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pro.price,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2-20,
                  child: Text(
                    pro.title,
                    softWrap: true,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
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
    );
  }
}
