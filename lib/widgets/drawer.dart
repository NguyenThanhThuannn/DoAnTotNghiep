import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

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
    return Drawer(
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
        ],
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
