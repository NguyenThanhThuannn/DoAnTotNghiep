import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

import '../config/textStyle.dart';
import '../features/homepage/data/models/drawer_responde_model.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({super.key});

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  bool isTransfer = false;
  bool isFavorite = false;
  bool isCart = true;
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
    // TODO: implement initState
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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 10 - 23,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 138, 238, 0.85),
                    Color.fromRGBO(0, 148, 255, 1),
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
                      _buildTranfer(isTransfer),
                      _buildFavorite(isFavorite),
                      _buildCart(isCart),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-150,
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
            Padding(padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: 'Search for products...',
                hintStyle: textStyleNewsReaderRegular18,
                suffixIcon: const Icon(Icons.search),
                suffixIconColor: Colors.grey,
              ),
            ),),
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
                  ],),
                  Text('Mediamarket 2017. All Rights Reververd',style: textStyleNobileRegular12,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Stack _buildTranfer(final bool isTransfer) {
  return Stack(
    children: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.share,
          color: Colors.white,
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

Stack _buildFavorite(final bool isFavorite) {
  return Stack(
    children: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.favorite_border,
          color: Colors.white,
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

Stack _buildCart(final bool isCart) {
  return Stack(
    children: [
      IconButton(
        onPressed: () {},
        icon: const HeroIcon(
          HeroIcons.shoppingBag,
          color: Colors.white,
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
