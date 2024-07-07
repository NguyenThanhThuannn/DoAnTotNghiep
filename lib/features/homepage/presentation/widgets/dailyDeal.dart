//DailyDeals
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/textStyle.dart';
import '../../../shopcartpage/presentation/view/shop_cart_screen.dart';
import '../../domain/entities/product.dart';
import '../bloc/home_page_bloc.dart';
import 'countDown_widget.dart';
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
  List<String> tab = ['New Arrivals', "Today's Deals", 'Best Seller'];
  List<ProductEntity> filterPro = [];
  List<ProductEntity> pro = [];
  List<ProductEntity> proNew = [];
  final PageController _pageController = PageController();
  int _currentPage = 0;

  int getRandomProductId(final List<ProductEntity> products) {
    final random = Random();
    final int randomIndex = random.nextInt(products.length);
    return products[randomIndex].id!;
  }

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (final context, final state) {
        if (state is HomePageLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomePageError) {
          return Center(
            child: Text(state.error.toString()),
          );
        }
        if (state is HomePageLoaded) {
          if (proNew.isEmpty) {
            proNew = state.products!
                .where(
                  (final element) => element.type!.contains('New'),
                )
                .toList();
          }
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
                          switch (selectedIndex) {
                            case 0:
                              proNew = state.products!
                                  .where(
                                    (final element) =>
                                        element.type!.contains('New'),
                                  )
                                  .toList();
                              break;
                            case 2:
                              proNew = state.products!
                                  .where(
                                    (final element) =>
                                        element.type!.contains('Best selling'),
                                  )
                                  .toList();
                              break;
                          }
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
                height: MediaQuery.of(context).size.height / 2 - 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (final context, final index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 2 - 200,
                      child: const VerticalDivider(),
                    );
                  },
                  itemCount: proNew.length,
                  itemBuilder: (final context, final index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (final context) => ShopCartScreen(sCart: proNew[index]),));
                      },
                      child: DailyDealItem(
                        pro: proNew[index],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(47, 255, 29, 1),
                    ),
                  ),
                  child: BlocBuilder<HomePageBloc, HomePageState>(
                    builder: (final context, final state) {
                      if (state is HomePageLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is HomePageError) {
                        return const Center(
                          child: Icon(Icons.replay),
                        );
                      }
                      if (state is HomePageLoaded) {
                        List<ProductEntity> proWeek = [];
                        proWeek = state.products!
                            .where(
                              (final element) =>
                                  element.type!.contains('Deal of the week'),
                            )
                            .toList();
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  onPressed: () {
                                    if (_currentPage > 0) {
                                      _pageController.previousPage(
                                        duration:
                                            const Duration(milliseconds: 300),
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
                                        duration:
                                            const Duration(milliseconds: 300),
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
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (final context) => ShopCartScreen(sCart: proWeek[index]),));
                                    },
                                    child: DealOfWeekItem(
                                      pro: proWeek[index],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width / 2 + 50,
                              height: MediaQuery.of(context).size.width / 2,
                              child: const CountdownTimerPage(),
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ),
              BlocBuilder<HomePageBloc, HomePageState>(
                builder: (final context, final state) {
                  if (state is HomePageLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is HomePageError) {
                    return const Center(
                      child: Icon(Icons.replay_rounded),
                    );
                  }
                  if (state is HomePageLoaded) {
                    final List<ProductEntity> proDaily2 = [];
                    for (var i = 0; i < 4; i++) {
                      final int randomProductId =
                          getRandomProductId(state.products!);
                      print('Random Product ID: $randomProductId');
                      proDaily2.addAll(
                        state.products!
                            .where(
                              (final element) => element.id == randomProductId,
                            )
                            .toList(),
                      );
                    }
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/1.7,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: proDaily2.length,
                        itemBuilder: (final context, final index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (final context) => ShopCartScreen(sCart: proDaily2[index]),));
                            },
                            child: index.isEven
                                ? Container(
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.grey),
                                      ),
                                    ),
                                    child: DailyDealItem2(
                                      pro: proDaily2[index],
                                    ),
                                  )
                                : DailyDealItem2(
                                    pro: proDaily2[index],
                                  ),
                          );
                        },
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
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
