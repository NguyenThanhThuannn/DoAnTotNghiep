import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

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
          color: Theme.of(context).brightness == Brightness.light? Colors.white:Colors.black,
        ),
      ),
      actions: [
        _buildTranfer(context,isTransfer),
        _buildFavorite(context,isFavorite),
        _buildCart(context,isCart),
        const SizedBox(
          width: 20,
        ),
      ],
      flexibleSpace: Container(
        margin: const EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              if (Theme.of(context).brightness == Brightness.light) const Color.fromRGBO(0, 138, 238, 0.85) else const Color.fromARGB(255, 255, 120, 17),
              if (Theme.of(context).brightness == Brightness.light) const Color.fromRGBO(124, 200, 255, 1) else const Color.fromARGB(255, 245, 203, 171),
            ],
          ),
        ),
      ),
    );
  }
}

Stack _buildTranfer(final BuildContext context,final bool isTransfer) {
  return Stack(
    children: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.compare_arrows_outlined,
          color: Theme.of(context).brightness==Brightness.light?Colors.white:Colors.black,
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
          child: Text('0',
              style:
                  TextStyle(color: isTransfer ? Colors.white : Colors.black),),
        ),
      ),
    ],
  );
}

Stack _buildFavorite(final BuildContext context,final bool isFavorite) {
  return Stack(
    children: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.favorite_border,
          color: Theme.of(context).brightness==Brightness.light?Colors.white:Colors.black,
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
          child: Text('0',
              style:
                  TextStyle(color: isFavorite ? Colors.white : Colors.black),),
        ),
      ),
    ],
  );
}

Stack _buildCart(final BuildContext context,final bool isCart) {
  return Stack(
    children: [
      IconButton(
        onPressed: () {},
        icon: HeroIcon(
          HeroIcons.shoppingBag,
          color: Theme.of(context).brightness==Brightness.light?Colors.white:Colors.black,
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
          child: Text('2',
              style: TextStyle(color: isCart ? Colors.white : Colors.black),),
        ),
      ),
    ],
  );
}
