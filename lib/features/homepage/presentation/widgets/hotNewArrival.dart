import 'dart:convert';
import 'dart:developer';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../config/format_number.dart';
import '../../../../config/image.dart';
import '../../../../config/textStyle.dart';
import '../../domain/entities/product.dart';
import '../bloc/home_page_bloc.dart';
import 'dailyDealItemTab_widget.dart';

class HotNewArrival extends StatefulWidget {
  const HotNewArrival({super.key});

  @override
  State<HotNewArrival> createState() => _HotNewArrivalState();
}

class _HotNewArrivalState extends State<HotNewArrival> {
  int selectedIndex = 0;
  bool isItemSelected = true;
  late int itemClicked = -1;
  List<String> tab = [];
  List<ProductEntity> proHot = [];
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
          List<ProductEntity> filterPro = [];
          filterPro = state.products!
              .where((final element) => element.type!.contains('New'))
              .toList();
          for (var i = 0; i < 4; i++) {
            final int randomProductId = getRandomProductId(filterPro);
            if(proHot.isEmpty){
              proHot.addAll(
              filterPro
                  .where(
                    (final element) => element.id == randomProductId,
                  )
                  .toList(),
            );
            }
          }
          /* if (tab.isEmpty) {
            for (final i in state.hotnewarrival!) {
              tab.add(i.tab!);
            }
          } */
          /* if (filterPro.isEmpty) {
            filterPro = state.hotnewarrival!
                .where((final element) => element.tab! == tab[0])
                .toList();
            pro.clear();
            for (final i in filterPro) {
              pro.addAll(i.pro!);
            }
          } */
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Text.rich(
                  TextSpan(
                    text: 'Hot ',
                    style: textStyleInterSemiBold16,
                    children: [
                      TextSpan(
                        text: 'New Arrival',
                        style: textStyleInterRegular16,
                      ),
                    ],
                  ),
                ),
              ),
              /* SizedBox(
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
                          filterPro = state.hotnewarrival!
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
              const Divider(
                thickness: 1,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 50,
                  ),
                  itemCount: proHot.length,
                  itemBuilder: (final context, final index) {
                    return /* index%2==0
                ? Container(
                  decoration: const BoxDecoration(border: Border(right: BorderSide()),),
                  child: hotNewArrivalItem(pro: pro[index],isClicked: isClicked,),
                ):hotNewArrivalItem(pro: pro[index]); */
                        GestureDetector(
                      onTap: () {
                        setState(() {
                          isItemSelected = !isItemSelected;
                          itemClicked == -1
                              ? itemClicked = index
                              : itemClicked != index
                                  ? itemClicked = index
                                  : itemClicked = -1;
                        });
                      },
                      child: index % 2 == 0
                          ? Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: itemClicked == index
                                        ? Colors.transparent
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                              child: hotNewArrivalItem(
                                pro: proHot[index],
                                isClicked: itemClicked == index,
                              ),
                            )
                          : hotNewArrivalItem(
                              pro: proHot[index],
                              isClicked: itemClicked == index,
                            ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

class hotNewArrivalItem extends StatefulWidget {
  hotNewArrivalItem({super.key, required this.pro, required this.isClicked});
  ProductEntity pro;
  bool isClicked;

  @override
  State<hotNewArrivalItem> createState() => _hotNewArrivalItemState();
}

class _hotNewArrivalItemState extends State<hotNewArrivalItem>
    with SingleTickerProviderStateMixin {
  /* late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  ); */
  bool isFav = false;
  @override
  Widget build(final BuildContext context) {
    return widget.isClicked
        ? Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    children: [
                      if (ImageCheck().isBase64Image(widget.pro.product_image!))
                        Image.memory(
                          ImageCheck().base64ToImage(widget.pro.product_image!),
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.width / 4,
                          fit: BoxFit.contain,
                        )
                      else
                        CachedNetworkImage(
                          imageUrl: widget.pro.product_image ?? '',
                          imageBuilder: (final context, final imageProvider) {
                            return Container(
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                color: Colors.white,
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
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'ADD TO CART',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Text(
                            widget.pro.name!,
                            softWrap: true,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: textStyleInterMedium14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 5,
                  child: IconButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        isFav = !isFav;
                      });
                    },
                    icon: /* Icon(Icons.favorite_border,color: isFav?Colors.red:null,), */
                        isFav
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(Icons.favorite_border_outlined),
                  ),
                ),
                Positioned(
                  top: 55,
                  left: 5,
                  child: IconButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.compare_arrows_outlined),
                  ),
                ),
                //_buildSwitchCaseTag(context, widget.pro.tag, 15),
              ],
            ),
          )
        : Column(
            children: [
              Stack(
                children: [
                  if (ImageCheck().isBase64Image(widget.pro.product_image!))
                    Image.memory(
                      ImageCheck().base64ToImage(widget.pro.product_image!),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 3,
                      fit: BoxFit.contain,
                    )
                  else
                    CachedNetworkImage(
                      imageUrl: widget.pro.product_image ?? '',
                      imageBuilder: (final context, final imageProvider) {
                        return Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                          color: Colors.black,
                        );
                      },
                    ),
                  //_buildSwitchCaseTag(context, widget.pro.tag, 0),
                ],
              ),
              Text(
                CurrencyFormatter()
                    .formatNumber(widget.pro.product_item!.price!),
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Text(
                    widget.pro.name!,
                    softWrap: true,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}

Widget _buildSwitchCaseTag(
  final BuildContext context,
  final String? tag,
  final double right,
) {
  switch (tag) {
    case 'SALE':
      return Positioned(
        right: right,
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          color: Colors.greenAccent[400],
          child: Text(
            'SALE',
            style: textStyleKeaniaOne14W,
          ),
        ),
      );
    case 'HOT':
      return Positioned(
        right: right,
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          color: Colors.red,
          child: Text(
            'HOT',
            style: textStyleKeaniaOne14W,
          ),
        ),
      );
    case 'NEW':
      return Positioned(
        right: right,
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          color: Theme.of(context).primaryColor,
          child: Text(
            'NEW',
            style: textStyleKeaniaOne14W,
          ),
        ),
      );
    default:
      return Positioned(
        right: right,
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          color: Colors.yellow,
          child: Text(
            tag!,
            style: textStyleKeaniaOne14,
          ),
        ),
      );
  }
}
