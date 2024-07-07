import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/image.dart';
import '../../../../config/textStyle.dart';
import '../../../../widgets/appbar.dart';
import '../../../../widgets/drawer.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../../homepage/presentation/widgets/dailyDealItemTab_widget.dart';
import '../../../homepage/presentation/widgets/footer.dart';
import '../../data/models/shop_cart_response_model.dart';
import '../widgets/bundleItem_widget.dart';
import '../widgets/colorDropDown_widget.dart';
import '../widgets/infoProduct.dart';
import '../widgets/relateProduct.dart';
import '../widgets/reviewUsernameUI_widget.dart';

class ShopCartScreen extends StatefulWidget {
  ShopCartScreen({super.key, required this.sCart});
  ProductEntity sCart;
  @override
  State<ShopCartScreen> createState() => _ShopCartScreenState();
}

class _ShopCartScreenState extends State<ShopCartScreen> {

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      drawer: const DrawerCustom(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImage(context,widget.sCart),
            InfoProduct(sCart: widget.sCart),
            //_buildBundle(context, widget.sCart),
            ShopCartTab(
              sCart: widget.sCart,
            ),
            //RelateProduct(sCart: widget.sCart),
            const FooterCustom(),
          ],
        ),
      ),
    );
  }
}

Stack _buildImage(final BuildContext context, final ProductEntity pro) {
  return Stack(
    children: [
      if (ImageCheck().isBase64Image(pro.product_image!))
          Image.memory(
            ImageCheck().base64ToImage(pro.product_image!),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            fit: BoxFit.contain,
          )
        else
          CachedNetworkImage(
            imageUrl: pro.product_image ?? '',
            imageBuilder: (final context, final imageProvider) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
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
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.08)),
                  child: const CupertinoActivityIndicator(),
                ),
              );
            },
            errorWidget: (final context, final url, final error) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.04),
              );
            },
          ),
      Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(12, 12, 0, 12),
            padding: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width / 8,
            height: MediaQuery.of(context).size.width / 8,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: IconButton(
              style: const ButtonStyle(
                side: MaterialStatePropertyAll(BorderSide(color: Colors.grey)),
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(12, 0, 0, 12),
            width: MediaQuery.of(context).size.width / 8,
            height: MediaQuery.of(context).size.width / 8,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
            width: MediaQuery.of(context).size.width / 8,
            height: MediaQuery.of(context).size.width / 8,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
          ),
        ],
      ),
      Positioned(
        right: 0,
        top: 330,
        child: IconButton(
          style: const ButtonStyle(
            side: MaterialStatePropertyAll(BorderSide(color: Colors.grey)),
          ),
          onPressed: () {},
          icon: const Icon(
            Icons.play_arrow,
            color: Colors.grey,
          ),
        ),
      ),
    ],
  );
}

/* Container _buildBundle(final BuildContext context, final ProductEntity sCart) {
  final ValueNotifier<int> total = ValueNotifier<int>(0);
  String addDiacritics(final String price) {
    // Thêm dấu "." vào vị trí phù hợp
    String priceWithDot = '';
    final int length = price.length;
    for (int i = 0; i < length; i++) {
      priceWithDot += price[i];
      if (i == length - 4 || i == length - 7) {
        priceWithDot += '.';
      }
    }

    // Thêm "Đ" vào cuối chuỗi
    final String priceWithD = '$priceWithDotĐ';

    return priceWithD;
  }

  return Container(
    margin: const EdgeInsets.all(8),
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Text.rich(
          TextSpan(
            text: 'Buy this bundle ',
            style: textStyleInterBold16,
            children: [
              TextSpan(
                text: 'and get off to 25%',
                style: textStyleInterRegular16,
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 1.5 - 30,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (final context, final index) {
              return BundleItem(
                pro: sCart.pro![index],
                total: total,
              );
            },
            separatorBuilder: (final context, final index) {
              return Container(
                width: 1,
                height: 10,
                color: Colors.grey,
              );
            },
            itemCount: sCart.pro!.length,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<int>(
                  valueListenable: total,
                  builder: (final context, final value, final child) {
                    return Text.rich(
                      TextSpan(
                        text: 'Total Price: ',
                        style: textStyleInterSemiBold14,
                        children: [
                          TextSpan(
                            text: addDiacritics(value.toString()),
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Text(
                  'Bundle Price for Selected items',
                  style: textStyleInterSemiBold10,
                ),
              ],
            ),
            ElevatedButton(
              style: const ButtonStyle(
                side: MaterialStatePropertyAll(BorderSide(color: Colors.red)),
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                shadowColor: MaterialStatePropertyAll(
                  Colors.white,
                ),
              ),
              onPressed: () {},
              child: Text(
                'Thêm gói vào giỏ hàng',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
} */

class ShopCartTab extends StatefulWidget {
  ShopCartTab({super.key, required this.sCart});
  ProductEntity sCart;

  @override
  State<ShopCartTab> createState() => _ShopCartTabState();
}

class _ShopCartTabState extends State<ShopCartTab> {
  final List<String> tab = [
    'DESCRIPTION',
    'SPECIFICATION',
    'SHIPPING',
    'REVIEWS',
  ];
  int selectedIndex = 0;
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
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
                    if (index == 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    } else if (index == 3) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 30, 10),
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
          height: MediaQuery.of(context).size.width,
          child: PageView(
            controller: _pageController,
            onPageChanged: (final value) {
              setState(() {
                _currentPage = value;
              });
            },
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.5 - 50,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[300],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icon/youtube.png'),
                            Text(
                              'Tutorials available on Youtube',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Leave your phone alone',
                          style: textStyleInterSemiBold14,
                        ),
                        Text(
                          'This true 360° speaker was engineered to spread deep, jaw-dropping sound in every direction. That means, when everyone stands around it, everyone gets the same experience.',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset('assets/icon/leaf.png'),
                                  Text(
                                    'DESIGN & DEVELOPING',
                                    style: textStyleInterSemiBold14,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            10,
                                    child: Text(
                                      'The best-performing portable speaker from Bose',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey,
                                      ),
                                      softWrap: true,
                                      maxLines: 2,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'READ MORE',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor:
                                            Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset('assets/icon/ribbon.png'),
                                  Text(
                                    'HIGH-QUALITY',
                                    style: textStyleInterSemiBold14,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            10,
                                    child: Text(
                                      'The best-performing portable speaker from Bose',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey,
                                      ),
                                      softWrap: true,
                                      maxLines: 2,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'READ MORE',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor:
                                            Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const ReviewPageView(),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - 20,
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
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
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '(Based on 97 reviews)',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(widget.sCart.name!, style: textStyleInterSemiBold18W),
                  Text(
                    widget.sCart.description!,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icon/fire.png'),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'HIGH-QUALITY',
                                    style: textStyleInterSemiBold12W,
                                  ),
                                  Text(
                                    'Some of the people that are playing, and that have few rounds to play in the tournament dont count the drinks',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                    softWrap: true,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('assets/icon/heart.png'),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'AWESOME DESIGN',
                                    style: textStyleInterSemiBold12W,
                                  ),
                                  Text(
                                    'Some of the people that are playing, and that have few rounds to play in the tournament dont count the drinks',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                    ),
                                    softWrap: true,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ReviewPageView extends StatelessWidget {
  const ReviewPageView({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Reviews'),
              GestureDetector(
                //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ,)),
                child: const Icon(Icons.navigate_next_outlined),
              ),
            ],
          ),
          ReviewUsernameUI(star: 5,),
          const SizedBox(height: 15,),
          ReviewUsernameUI(star: 1,),
        ],
      ),
    );
  }
}