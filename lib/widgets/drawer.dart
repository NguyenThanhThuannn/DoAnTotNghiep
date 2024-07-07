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
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import '../config/textStyle.dart';
import '../features/blogpage/presentation/view/blog_screen.dart';
import '../features/faqpage/presentation/view/faq_screen.dart';
import '../features/homepage/domain/entities/product.dart';
import '../features/homepage/presentation/bloc/home_page_bloc.dart';
import '../features/homepage/presentation/view/home_page_screen.dart';
import '../features/search/data/models/search_model.dart';
import '../features/search/domain/entities/search.dart';
import '../features/search/presentation/bloc/local_search_bloc.dart';
import '../features/search/presentation/widgets/search_tile_widget.dart';
import 'settings_screen.dart';
import 'shopping_cart_screen.dart';

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
      child: PopScope(
        canPop: false,
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
                _buildDrawerItem(context, 'BLOG'),
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
                _buildDrawerItem(context, 'SETTINGS'),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    onTap: () {
                      showSearch(context: context, delegate: CustomSearch());
                    },
                    readOnly: true,
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
                        icon: const FaIcon(FontAwesomeIcons.facebookF),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.twitter),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.pinterest),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.youtube),
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
      onTap: () async {
        setState(() {
          switch (title) {
            case 'HOME':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (final context) => const HomePageScreen(),
                ),
              );
              break;
            case 'BLOG':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (final context) => const BlogScreen(),
                ),
              );
              break;
            case 'PRODUCTS':
              Navigator.of(context).pop();
              break;
            case 'BRANDS':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (final context) => const FAQScreen(),
                ),
              );
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
            case 'SETTINGS':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (final context) => const SettingScreen(),
                ),
              );
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
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (final context) => const ShoppingCartScreen(),));
        },
        icon: HeroIcon(
          HeroIcons.shoppingBag,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black,
        ),
      ),
    ],
  );
}

class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(final BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          BlocProvider.of<LocalSearchBloc>(context)
              .add(SaveItemSearch(SearchEntity(name: query)));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.black,
            content: Text('$query saved successfully.'),
          ),);
        },
        icon: const Icon(Icons.save_alt_outlined),
      ),
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(final BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: const Icon(Icons.navigate_before_outlined),
    );
  }

  @override
  Widget buildResults(final BuildContext context) {
    return _buildSearchLocal(context);
  }

  @override
  Widget buildSuggestions(final BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (final context, final state) {
        if (state is HomePageLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomePageLoaded) {
          final searches = state.products;
          log('buildSuggestions: $searches');
          final filteredSearches = searches?.where((final search) {
            return search.name!.toLowerCase().contains(query.toLowerCase());
          }).toList();

          if (filteredSearches == null || filteredSearches.isEmpty) {
            return const Center(child: Text('No results found'));
          }
          return ListView.builder(
            itemCount: filteredSearches.length,
            itemBuilder: (final context, final index) {
              final search = filteredSearches[index];
              return ItemSearchWidget2(
                search: search,
              );
            },
          );
        } else {
          return const Center(child: Text('An error occurred'));
        }
      },
    );
  }

  Widget _buildSearchLocal(final context){
    return BlocBuilder<LocalSearchBloc, LocalSearchState>(
      builder: (final context, final state) {
        if (state is LocalSearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LocalSearchDone) {
          final searches = state.searches;
          log('buildResults $searches');
          final filteredSearches = searches?.where((final search) {
            return search.name!.contains(query);
          }).toList();

          if (filteredSearches == null || filteredSearches.isEmpty) {
            return const Center(child: Text('No results found'));
          }
          return ListView.builder(
            itemCount: filteredSearches.length,
            itemBuilder: (final context, final index) {
              final search = filteredSearches[index];
              return ItemSearchWidget(
                search: search,
                isRemovable: true,
                onRemove: (final search) =>
                    BlocProvider.of<LocalSearchBloc>(context)
                        .add(RemoveItemSearch(search)),
                onItemSearchPressed: (final title) => query = title,
              );
            },
          );
        } else {
          return const Center(child: Text('An error occurred'));
        }
      },
    );
  }
}
