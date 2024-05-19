/* import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../config/textStyle.dart';
import '../features/homepage/data/models/drawer_responde_model.dart';
import '../features/themechange/bloc/theme_bloc.dart';
import '../features/themechange/data/theme.dart';
import '../features/themechange/domain/themeEntity.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({super.key});

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  
  List<DrawerModelItem> drawer = [
    DrawerModelItem(
      name: 'HOME',
      items: [
        ItemModel(item: 'Contact'),
        ItemModel(item: 'FAQ'),
        ItemModel(item: '404 Page'),
        ItemModel(item: 'Comming soon'),
      ],
    ),
    DrawerModelItem(
      name: 'SHOP',
      items: [
        ItemModel(item: 'Contact'),
        ItemModel(item: 'FAQ'),
        ItemModel(item: '404 Page'),
        ItemModel(item: 'Comming soon'),
      ],
    ),
    DrawerModelItem(
      name: 'BLOG',
      items: [
        ItemModel(item: 'Contact'),
        ItemModel(item: 'FAQ'),
        ItemModel(item: '404 Page'),
        ItemModel(item: 'Comming soon'),
      ],
    ),
    DrawerModelItem(
      name: 'PAGES',
      items: [
        ItemModel(item: 'Contact'),
        ItemModel(item: 'FAQ'),
        ItemModel(item: '404 Page'),
        ItemModel(item: 'Comming soon'),
      ],
    ),
    DrawerModelItem(name: 'PRODUCTS'),
    DrawerModelItem(name: 'BRANDS'),
    DrawerModelItem(name: "TODAY'S DEAL"),
    DrawerModelItem(name: 'NEW ARRIVALS'),
    DrawerModelItem(name: 'GIFT CARDS'),
  ];
  @override
  void initState() {
    super.initState();
    log(drawer.toString());
  }

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Drawer(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            
            Container(
              margin: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: drawer.length,
                separatorBuilder: (final context, final index) {
                  return const Divider(
                    color: Colors.grey,
                  );
                },
                itemBuilder: (final context, final index) {
                  return drawerItem(
                    drawer: drawer[index],
                  );
                },
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.abc),
                      Icon(Icons.abc),
                      Icon(Icons.abc),
                      Icon(Icons.abc),
                    ],
                  ),
                  Text(
                    'Mediamarket 2017. All Rights Reververd',
                    style: textStyleNobileRegular12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class drawerItem extends StatefulWidget {
  drawerItem({super.key, required this.drawer});
  DrawerModelItem drawer;

  @override
  State<drawerItem> createState() => _drawerItemState();
}

class _drawerItemState extends State<drawerItem> {
  bool isExpanded = false;
  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
                if (widget.drawer.items == null) Navigator.of(context).pop();
              });
            },
            title: Text(
              widget.drawer.name,
              style: widget.drawer.name.contains("TODAY'S DEAL")
                  ? GoogleFonts.anybody(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    )
                  : isExpanded
                      ? GoogleFonts.anybody(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).primaryColor,
                        )
                      : textStyleAnybodyRegular18,
            ),
            trailing: widget.drawer.items != null
                ? SizedBox(
                    height: 50,
                    child: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up_outlined
                          : Icons.keyboard_arrow_down_outlined,
                      color: isExpanded ? Theme.of(context).primaryColor : null,
                    ),
                  )
                : const SizedBox(),
          ),
          if (isExpanded && widget.drawer.items != null)
            Container(
              color: Colors.grey[300],
              height: calculateListViewHeight(),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.drawer.items!.length,
                separatorBuilder: (final context, final index) {
                  return const Divider(
                    color: Colors.grey,
                  );
                },
                itemBuilder: (final context, final index) {
                  return ListTile(
                    title: Text(
                      widget.drawer.items![index].item,
                      style: GoogleFonts.anybody(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                      ),
                    ),
                    onTap: () {},
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  double calculateListViewHeight() {
    const itemHeight = 55.0; // Chiều cao trung bình của mỗi phần tử ListTile
    final itemCount = widget.drawer.items!.length;
    final totalHeight = itemHeight * itemCount;
    const paddingHeight = 16.0; // Thêm padding cho các phần tử
    return totalHeight + paddingHeight + 30;
  }
}
 */
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../config/textStyle.dart';
import '../features/faqpage/presentation/view/faq_screen.dart';
import '../features/homepage/presentation/view/home_page_screen.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({super.key});

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  bool isTransfer = false;
  bool isFavorite = false;
  bool isCart = true;
  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Drawer(
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 10 - 23,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          if (Theme.of(context).brightness == Brightness.light)
                            const Color.fromRGBO(0, 138, 238, 0.85)
                          else
                            const Color.fromARGB(255, 255, 120, 17),
                          if (Theme.of(context).brightness == Brightness.light)
                            const Color.fromRGBO(124, 200, 255, 1)
                          else
                            const Color.fromARGB(255, 245, 203, 171),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5, top: 5),
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                Navigator.of(context).pop();
                              });
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            _buildTranfer(context, isTransfer),
                            _buildFavorite(context, isFavorite),
                            _buildCart(context, isCart),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _buildDrawerItem(context, 'HOME'),
              const Divider(
                height: 1,
                color: Colors.grey,
                indent: 15,
                endIndent: 15,
              ),
              _buildExpandableDrawerItem(context, 'SHOP'),
              const Divider(
                height: 1,
                color: Colors.grey,
                indent: 15,
                endIndent: 15,
              ),
              _buildExpandableDrawerItem(context, 'BLOG'),
              const Divider(
                height: 1,
                color: Colors.grey,
                indent: 15,
                endIndent: 15,
              ),
              _buildExpandableDrawerItem(context, 'PAGES', [
                'Contact',
                'FAQ',
                '404 Page',
                'Coming Soon',
              ]),
              const Divider(
                height: 1,
                color: Colors.grey,
                indent: 15,
                endIndent: 15,
              ),
              _buildDrawerItem(context, 'PRODUCTS'),
              const Divider(
                height: 1,
                color: Colors.grey,
                indent: 15,
                endIndent: 15,
              ),
              _buildDrawerItem(context, 'BRANDS'),
              const Divider(
                height: 1,
                color: Colors.grey,
                indent: 15,
                endIndent: 15,
              ),
              _buildDrawerItem(context, "TODAY'S DEALS"),
              const Divider(
                height: 1,
                color: Colors.grey,
                indent: 15,
                endIndent: 15,
              ),
              _buildDrawerItem(context, 'NEW ARRIVALS'),
              const Divider(
                height: 1,
                color: Colors.grey,
                indent: 15,
                endIndent: 15,
              ),
              _buildDrawerItem(context, 'GIFT CARDS'),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    hintText: 'Search for products...',
                    hintStyle: textStyleNewsReaderRegular18,
                    suffixIcon: const Icon(Icons.search),
                    suffixIconColor: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.facebook), onPressed: () {},),
                    IconButton(
                      icon: const Icon(Icons.facebook_outlined),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.food_bank_outlined),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.facebook_sharp),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text(
                  '© Mediamarket 2017. All Rights Reserved',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    final BuildContext context,
    final String title,
  ) {
    return ListTile(
      title: Text(
        title,
        style: title.contains("TODAY'S DEAL")
            ? GoogleFonts.anybody(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.red,
              )
            : textStyleAnybodyRegular18,
      ),
      onTap: () {
        setState(() {
          switch (title) {
            case 'HOME':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (final context) => const HomePageScreen(),
                  ),);
              break;
            case 'PRODUCTS':
              Navigator.of(context).pop();
              break;
            case 'BRANDS':
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (final context) => const FAQScreen(),
                  ),);
              break;
            case "TODAY'S DEALS":
              Navigator.of(context).pop();
              break;
            case 'NEW ARRIVALS':
              Navigator.of(context).pop();
              break;
            case 'GIFT CARDS':
              Navigator.of(context).pop();
              break;
          }
        });
      },
    );
  }

  Widget _buildExpandableDrawerItem(
    final BuildContext context,
    final String title, [
    final List<String>? subItems,
  ]) {
    return ExpansionTile(
      textColor: Theme.of(context).primaryColor,
      title: Text(title, style: textStyleAnybodyRegular18),
      children: subItems
              ?.map((final subItem) => buildSubDrawerItem(context, subItem))
              .toList() ??
          [],
    );
  }

  Widget buildSubDrawerItem(final BuildContext context, final String title) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.anybody(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.grey[600],
        ),
      ),
      onTap: () {
        // Handle navigation or other actions
      },
    );
  }
}

Stack _buildTranfer(final BuildContext context, final bool isTransfer) {
  return Stack(
    children: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.compare_arrows_outlined,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black,
        ),
      ),
      Positioned(
        top: 25,
        left: 25,
        child: Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isTransfer ? Colors.red : Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            '0',
            style: TextStyle(color: isTransfer ? Colors.white : Colors.black),
          ),
        ),
      ),
    ],
  );
}

Stack _buildFavorite(final BuildContext context, final bool isFavorite) {
  return Stack(
    children: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.favorite_border,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black,
        ),
      ),
      Positioned(
        top: 25,
        left: 25,
        child: Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isFavorite ? Colors.red : Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            '0',
            style: TextStyle(color: isFavorite ? Colors.white : Colors.black),
          ),
        ),
      ),
    ],
  );
}

Stack _buildCart(final BuildContext context, final bool isCart) {
  return Stack(
    children: [
      IconButton(
        onPressed: () {},
        icon: HeroIcon(
          HeroIcons.shoppingBag,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black,
        ),
      ),
      Positioned(
        top: 25,
        left: 25,
        child: Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isCart ? Colors.red : Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            '2',
            style: TextStyle(color: isCart ? Colors.white : Colors.black),
          ),
        ),
      ),
    ],
  );
}
