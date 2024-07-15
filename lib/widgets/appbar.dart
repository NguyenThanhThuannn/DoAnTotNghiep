import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

import '../features/favoritepage/presentation/bloc/favourite_bloc.dart';
import '../features/favoritepage/presentation/view/favourite_screen.dart';
import '../features/homepage/presentation/bloc/home_page_bloc.dart';
import '../features/loginregisterpage/data/model/user_model.dart';
import '../features/loginregisterpage/data/services/provider.dart';
import '../features/loginregisterpage/presentation/bloc/user_bloc.dart';
import '../features/search/domain/entities/search.dart';
import '../features/search/presentation/bloc/local_search_bloc.dart';
import '../injection_container.dart';
import 'payment.dart';
import 'shopping_cart_screen.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _AppBarCustomState extends State<AppBarCustom> {
  bool isTransfer = false;
  bool isFavorite = false;
  bool isCart = true;
  @override
  Widget build(final BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black,
        ),
      ),
      actions: [
        _buildFavorite(context, isFavorite),
        _buildCart(context, isCart),
        const SizedBox(
          width: 20,
        ),
      ],
      flexibleSpace: Container(
        margin: const EdgeInsets.only(top: 25),
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
      ),
    );
  }
}

Stack _buildFavorite(final BuildContext context, final bool isFavorite) {
  return Stack(
    children: [
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (final context) => const FavouriteScreen(),
            ),
          );
        },
        icon: Icon(
          Icons.favorite_border,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black,
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (final context) => const ShoppingCartScreen(),
            ),
          );
        },
        icon: HeroIcon(
          HeroIcons.shoppingBag,
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black,
        ),
      ),
      BlocBuilder<UserBloc, UserState>(
        builder: (final context, final state) {
          if (state is UserLoading) {
            return Positioned(
              top: 25,
              left: 25,
              child: Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Text(
                  '0',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          }
          if (state is UserLoaded) {
            return Visibility(
              visible: state.user!.shopping_cart!.items!.isEmpty?false:true,
              child: Positioned(
                top: 25,
                left: 25,
                child: Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    '${state.user!.shopping_cart!.items!.length}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    ],
  );
}
