//DailyDeals
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/textStyle.dart';
import '../../domain/entities/product.dart';
import '../bloc/home_page_dailydeals_bloc.dart';
import '../bloc/home_page_dailydealsweek2_bloc.dart';
import '../bloc/home_page_dailydealsweek_bloc.dart';
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
  List<String> tab = [];
  List<DailyDealsEntity> filterPro = [];
  List<ProductEntity> pro = [];
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<HomePageDailydealsBloc, HomePageDailydealsState>(
      builder: (final context, final state) {
        if (state is HomePageDailydealsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomePageDailyDealsError) {
          return Center(
            child: Text(state.error.toString()),
          );
        }
        if (state is HomePageDailyDealsLoaded) {
          if (tab.isEmpty) {
            for (final i in state.dailyDeals!) {
              tab.add(i.tab!);
            }
          }
          if (filterPro.isEmpty) {
            filterPro = state.dailyDeals!
                .where((final element) => element.tab! == tab[0])
                .toList();
            pro.clear();
            for (final i in filterPro) {
              pro.addAll(i.pro!);
            }
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
                          filterPro = state.dailyDeals!
                              .where(
                                (final element) =>
                                    element.tab! == tab[selectedIndex],
                              )
                              .toList();
                          log('Lọc ra là: $filterPro');
                          pro.clear();
                          for (final i in filterPro) {
                            pro.addAll(i.pro!);
                          }
                          log('SP sau khi lọc: $pro');
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
                                border: Border(
                                  right: BorderSide(color: Colors.grey),
                                ),
                              ),
                              child: DailyDealItem(
                                pro: pro[index],
                              ),
                            )
                          : DailyDealItem(
                              pro: pro[index],
                            ),
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
                  child: BlocBuilder<HomePageDailydealsweekBloc,
                      HomePageDailydealsweekState>(
                    builder: (final context, final state) {
                      if (state is HomePageDailydealsweekLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is HomePageDailydealsweekError) {
                        return const Center(
                          child: Icon(Icons.replay),
                        );
                      }
                      if (state is HomePageDailydealsweekLoaded) {
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
                                    if (_currentPage <
                                        state.dailydealsweek!.length) {
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
                                    log(_currentPage.toString());
                                  });
                                },
                                itemCount: state.dailydealsweek!.length,
                                itemBuilder: (final context, final index) {
                                  return DealOfWeekItem(
                                    pro: state.dailydealsweek![index],
                                  );
                                },
                              ),
                            ),
                            _buildDailyDealHurryUp(context),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.width / 6,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildDailyDealTimeOut(context, 6, 'DAYS'),
                                  _buildDailyDealTimeOut(context, 7, 'HOURS'),
                                  _buildDailyDealTimeOut(context, 35, 'MNS'),
                                  _buildDailyDealTimeOut(context, 24, 'SECS'),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ),
              BlocBuilder<HomePageDailydealsweek2Bloc,
                  HomePageDailydealsweek2State>(
                builder: (final context, final state) {
                  if (state is HomePageDailydealsweek2Loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is HomePageDailydealsweek2Error) {
                    return const Center(
                      child: Icon(Icons.replay_rounded),
                    );
                  }
                  if (state is HomePageDailydealsweek2Loaded) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: state.dailydealsweek2!.length,
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
                                    child: DailyDealItem2(
                                      pro: state.dailydealsweek2![index],
                                    ),
                                  )
                                : DailyDealItem2(
                                    pro: state.dailydealsweek2![index],
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
