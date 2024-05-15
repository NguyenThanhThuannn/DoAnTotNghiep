import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../config/textStyle.dart';
import '../../../../injection_container.dart';
import '../../../../widgets/appbar.dart';
import '../../../../widgets/drawer.dart';
import '../../../shopbycategorypage/presentation/view/shopbycategory_screen.dart';
import '../../../shopcartpage/presentation/view/shop_cart_screen.dart';
import '../../data/models/product_models_response.dart';
import '../../domain/entities/product.dart';
import '../bloc/home_page_bloc.dart';
import '../bloc/home_page_dailydeals_bloc.dart';
import '../bloc/home_page_dailydealsweek2_bloc.dart';
import '../bloc/home_page_dailydealsweek_bloc.dart';
import '../bloc/home_page_hotnewarrival_bloc.dart';
import '../bloc/home_page_recentbrowsing_bloc.dart';
import '../bloc/home_page_todaysdeals_bloc.dart';
import '../widgets/bestSellingItem_widget.dart';
import '../widgets/dailyDeal.dart';
import '../widgets/dailyDealItem_widget.dart';
import '../widgets/footer.dart';
import '../widgets/hotNewArrival.dart';
import '../widgets/todayDeal.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(final BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomePageBloc>(
          create: (final context) => sl()..add(GetBestSellings()),
        ),
        BlocProvider<HomePageDailydealsBloc>(
          create: (final context) => sl()..add(GetDailyDeals()),
        ),
        BlocProvider<HomePageRecentbrowsingBloc>(
          create: (final context) => sl()..add(GetRecentBrowsing()),
        ),
        BlocProvider<HomePageDailydealsweekBloc>(
          create: (final context) => sl()..add(GetDailyDealsWeek()),
        ),
        BlocProvider<HomePageDailydealsweek2Bloc>(
          create: (final context) => sl()..add(GetDailyDealsWeek2()),
        ),
        BlocProvider<HomePageHotnewarrivalBloc>(
          create: (final context) => sl()..add(GetHotNewArrivals()),
        ),
        BlocProvider<HomePageTodaysdealsBloc>(
          create: (final context) => sl()..add(GetTodaysDeals()),
        ),
      ],
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (final context, final state) {
          if (state is HomePageLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is HomePageError) {
            return const Scaffold(
              body: Center(
                child: Icon(Icons.replay_outlined),
              ),
            );
          }
          if (state is HomePageLoaded) {
            return Scaffold(
              appBar: const AppBarCustom(),
              drawer: const DrawerCustom(),
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 370,
                        child: Stack(
                          children: [
                            PageView(
                              controller: _pageController,
                              onPageChanged: (final value) {
                                setState(() {
                                  _currentPage = value;
                                });
                              },
                              children: [
                                _buildPageOne(context),
                                _buildPageOne(context),
                                _buildPageOne(context),
                              ],
                            ),
                            Positioned(
                              bottom: 10,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(3, (final index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(25),
                                        color: _currentPage == index
                                            ? Colors.white
                                            : null,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                              ),
                              child: ListTile(
                                trailing: const Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  setState(() {
                                    Navigator.push(context, MaterialPageRoute(builder: (final context) => const ShopByCategoryScreen(),));
                                  });
                                },
                                title: Text(
                                  'SHOP BY CATEGORY',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            _buildContainerLiner(
                              context,
                              'GEAR ',
                              'CONTROLLER',
                              'Step into Rift',
                              const Color.fromRGBO(58, 37, 188, 1),
                              const Color.fromRGBO(128, 117, 194, 1),
                              'assets/img/gear.png',
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            _buildContainerLiner(
                              context,
                              'OSMO ',
                              'MOBILE',
                              'Beyond Smart',
                              const Color.fromRGBO(60, 187, 49, 1),
                              const Color.fromRGBO(137, 233, 129, 1),
                              'assets/img/osmo.png',
                            ),
                          ],
                        ),
                      ),
                      _buildBestSelling(context, state.bestSelling),
                      const DailyDeal(),
                      BlocBuilder<HomePageRecentbrowsingBloc,
                          HomePageRecentbrowsingState>(
                        builder: (final context, final state) {
                          if (state is HomePageRecentbrowsingLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is HomePageRecentbrowsingError) {
                            return const Center(child: Icon(Icons.replay));
                          }
                          if (state is HomePageRecentbrowsingLoaded) {
                            return _buildRecentBrowsing(
                              context,
                              state.recentBrowsing!,
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      const HotNewArrival(),
                      const TodayDeal(),
                      const FooterCustom(),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

Container _buildPageOne(final BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 370,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(217, 217, 217, 1),
          Color.fromRGBO(155, 167, 171, 1),
        ],
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Effcient in every way',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Washing made smart and fast',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ElevatedButton(
          style: const ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
            backgroundColor:
                MaterialStatePropertyAll(Color.fromRGBO(74, 231, 61, 1)),
          ),
          onPressed: () {},
          child: Text(
            'Explore now',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

Container _buildContainerLiner(
  final BuildContext context,
  final String text1,
  final String text2,
  final String subtitle,
  final Color color1,
  final Color color2,
  final String url,
) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 180,
    padding: const EdgeInsets.only(top: 20, left: 15),
    alignment: Alignment.topLeft,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          color1,
          color2,
        ],
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: text1,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: text2,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                side: MaterialStatePropertyAll(
                  BorderSide(color: Colors.white),
                ),
                backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              onPressed: () {},
              child: Text(
                'See more',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Image.asset(url),
      ],
    ),
  );
}

Stack _buildBestSelling(
  final BuildContext context,
  final List<ProductEntity>? proBestSelling,
) {
  final PageController pageController = PageController();
  int currentPage = 0;
  return Stack(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width - 150,
        color: Colors.amber,
      ),
      Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Best Selling',
                      style: textStyleInterBold18,
                    ),
                    Text(
                      'Products this week',
                      style: textStyleInterMedium18,
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        if (currentPage > 0) {
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                      icon: const Icon(Icons.keyboard_arrow_left_outlined),
                      color: Colors.grey,
                    ),
                    IconButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        if (currentPage < proBestSelling!.length) {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                      icon: const Icon(Icons.keyboard_arrow_right_outlined),
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (final index) {
                  currentPage = index;
                },
                itemCount: proBestSelling!.length,
                itemBuilder: (final context, final index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (final context) => ShopCartScreen(sCart: proBestSelling[index]),));
                    },
                    child: BestSellingItem(
                      pro: proBestSelling[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Container _buildRecentBrowsing(
  final BuildContext context,
  final List<ProductEntity> proRecentBrowsing,
) {
  return Container(
    color: Colors.grey[200],
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height / 3.5,
    child: Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 10,
          child: Text.rich(
            textAlign: TextAlign.center,
            maxLines: 2,
            softWrap: true,
            TextSpan(
              text: 'Recommended based ',
              style: textStyleInterSemiBold16,
              children: [
                TextSpan(
                  text: 'on recent browsing',
                  style: textStyleInterRegular14,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: proRecentBrowsing.length,
            itemBuilder: (final context, final index) {
              return Container(
                margin: const EdgeInsets.only(top: 8, left: 15),
                color: Colors.white,
                child: DailyDealItem(pro: proRecentBrowsing[index]),
              );
            },
          ),
        ),
      ],
    ),
  );
}
