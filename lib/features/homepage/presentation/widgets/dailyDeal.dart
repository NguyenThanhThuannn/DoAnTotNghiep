//DailyDeals
import 'package:flutter/material.dart';

import '../../../../config/textStyle.dart';
import '../../data/models/product_models_response.dart';
import 'dailyDealItem2_widget.dart';
import 'dailyDealItemTab_widget.dart';
import 'dailyDealItem_widget.dart';
import 'dealOfWeekItem_widget.dart';

class DailyDeal extends StatefulWidget {
  const DailyDeal({super.key});

  @override
  State<DailyDeal> createState() => _DailyDealState();
}

class _DailyDealState extends State<DailyDeal> {
  int selectedIndex = 0;
  List<String> tab = ['New Arrivals', 'Today’s Deals', 'Best Seller'];
  List<Product> pro = [
    Product(
      price: '7,482,252Đ',
      title: 'Beats Solo3 Wireless On-Ear Headphones',
      tag: 'HOT',
    ),
    Product(
      price: '96,999,000Đ',
      title: 'Devialet Gala PhantomWireless Speaker',
      price_sale: '88,000,000Đ ',
      tag: 'SALE',
    ),
  ];
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<Product> proWeek = [
    Product(
      price: '7,458,555Đ',
      title: 'Sonos PLAY:1 Wireless Speaker',
      price_sale: '4,987,752Đ ',
      SLTon: 7,
      SLDaBan: 2,
    ),
    Product(
      price: '7,458,555Đ',
      title: 'Sonos PLAY:1 Wireless Speaker',
      price_sale: '4,987,752Đ ',
      SLTon: 5,
      SLDaBan: 4,
    ),
    Product(
      price: '7,458,555Đ',
      title: 'Sonos PLAY:1 Wireless Speaker',
      price_sale: '4,987,752Đ ',
      SLTon: 6,
      SLDaBan: 3,
    ),
    Product(
      price: '7,458,555Đ',
      title: 'Sonos PLAY:1 Wireless Speaker',
      price_sale: '4,987,752Đ ',
      SLTon: 7,
      SLDaBan: 2,
    ),
  ];
  List<Product> pro2 = [
    Product(
      price: '2.537.230Đ',
      title: 'Sonos Boost Wireless Speaker',
      tag: 'HOT',
    ),
    Product(
      price: '3.298.780Đ',
      title: 'Bose SoundLink Color Bluetooth Speaker II',
    ),
    Product(
      price: '4.061.473Đ',
      title: 'TV Premium UHD TV from Samsung',
    ),
    Product(
      price: '4.568.030Đ',
      title: 'R2-D2 Droid by Sphera',
    ),
  ];

  @override
  Widget build(final BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Daily Deals! Get Our Best Prices',
          style: textStyleInterBold18,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
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
        const Divider(
          thickness: 1,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2 - 220,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: pro.length,
            itemBuilder: (final context, final index) {
              return GestureDetector(
                onTap: () {
                  print('CLicked');
                },
                child: index % 2 == 0
                    ? Container(
                        decoration: const BoxDecoration(
                          border: Border(right: BorderSide(color: Colors.grey)),
                        ),
                        child: DailyDealItem(pro: pro[index]),
                      )
                    : DailyDealItem(pro: pro[index]),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2 + 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromRGBO(47, 255, 29, 1),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        if (_currentPage > 0) {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Deals ',
                        style: textStyleInterSemiBold16,
                        children: [
                          TextSpan(
                            text: 'of the week',
                            style: textStyleInterRegular16,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        if (_currentPage < proWeek.length) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (final index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: proWeek.length,
                    itemBuilder: (final context, final index) {
                      return DealOfWeekItem(pro: proWeek[index]);
                    },
                  ),
                ),
                _buildDailyDealHurryUp(context),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildDailyDealTimeOut(context, 6, 'DAYS'),
                      _buildDailyDealTimeOut(context, 7, 'HOURS'),
                      _buildDailyDealTimeOut(context, 35, 'MNS'),
                      _buildDailyDealTimeOut(context, 24, 'SECS'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/2,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
            ),
            itemCount: pro2.length,
            itemBuilder: (final context, final index) {
              return GestureDetector(
                onTap: () {},
                child: index % 2 == 0
                    ? Container(
                      alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: DailyDealItem2(pro: pro2[index]),
                      )
                    : DailyDealItem2(pro: pro2[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

Column _buildDailyDealHurryUp(final BuildContext context) {
  return Column(
    children: [
      Text(
        'HURRY UP!',
        style: textStyleInterBold16,
      ),
      Text(
        'Offer Ends In:',
        style: textStyleInterExtraLight14,
      ),
    ],
  );
}

Column _buildDailyDealTimeOut(
  final BuildContext context,
  final int num,
  final String text,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: MediaQuery.of(context).size.width / 10,
        height: MediaQuery.of(context).size.width / 10,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          color: Colors.grey[200],
        ),
        child: num < 10
            ? Text(
                '0$num',
                style: textStyleInterExtraBold14,
              )
            : Text(
                num.toString(),
                style: textStyleInterExtraBold14,
              ),
      ),
      Text(
        text,
        style: textStyleInterSemiBold10,
      ),
    ],
  );
}
