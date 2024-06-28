import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/format_number.dart';
import '../../../../config/textStyle.dart';
import '../../domain/entities/product.dart';
import '../bloc/home_page_bloc.dart';
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
  List<String> tab = [];
  List<ProductEntity> filterPro = [];

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
          /* if (tab.isEmpty) {
            for (final i in state.bestSelling!) {
              tab.add(i.tab!);
            }
          }
          if (filterPro.isEmpty) {
            filterPro = state.todaysdeals!
                .where((final element) => element.tab! == tab[0])
                .toList();
            pro.clear();
            for (final i in filterPro) {
              pro.addAll(i.pro!);
            }
          } */
          final List<ProductEntity> pro = [];
          for (final element in state.products!) {pro.add(element);}
          return Container(
            color: Colors.grey[200],
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
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
                /* SizedBox(
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
                            filterPro = state.todaysdeals!
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
                ), */
                const Divider(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5 - 40,
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
                  children:
                      List.generate((pro.length / 2).ceil(), (final index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
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
        return const SizedBox();
      },
    );
  }
}

class todayDealItem extends StatelessWidget {
  todayDealItem({super.key, required this.pro});
  ProductEntity pro;

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 3,
      color: Colors.white,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: pro.product_image!,
            imageBuilder: (final context, final imageProvider) {
              return Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.04),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
            progressIndicatorBuilder:
                (final context, final url, final progress) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                  child: const CupertinoActivityIndicator(),
                ),
              );
            },
            errorWidget: (final context, final url, final error) {
              return Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 2,
                color: Colors.black.withOpacity(0.04),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CurrencyFormatter().formatNumber(pro.product_item!.price!),
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  child: Text(
                    pro.name!,
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
                      '(${17})',
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
