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
  bool isTransfer=false;
  bool isFavorite=false;
  bool isCart=true;
  @override
  Widget build(final BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: () {
        Scaffold.of(context).openDrawer();
      }, icon: const Icon(Icons.menu,color: Colors.white,),),
      actions: [
        _buildTranfer(isTransfer),
        _buildFavorite(isFavorite),
        _buildCart(isCart),
        const SizedBox(width: 20,),
      ],
      flexibleSpace: Container(
        margin: const EdgeInsets.only(top: 25),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 138, 238, 0.85),
              Color.fromRGBO(0, 148, 255, 1),
            ],
          ),
        ),
      ),
    );
  }
}

Stack _buildTranfer(final bool isTransfer){
  return Stack(
    children: [
      IconButton(onPressed: () {
        
      }, icon: const Icon(Icons.compare_arrows_outlined, color: Colors.white,),),
      Positioned(
        top: 25,
        left: 25,
        child: Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isTransfer?Colors.red:Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text('0', style: TextStyle(color: isTransfer?Colors.white:Colors.black)),),
      ),
    ],
  );
}

Stack _buildFavorite(final bool isFavorite){
  return Stack(
    children: [
      IconButton(onPressed: () {
        
      }, icon: const Icon(Icons.favorite_border, color: Colors.white,),),
      Positioned(
        top: 25,
        left: 25,
        child: Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isFavorite?Colors.red:Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text('0', style: TextStyle(color: isFavorite?Colors.white:Colors.black)),
      ),),
    ],
  );
}

Stack _buildCart(final bool isCart){
  return Stack(
    children: [
      IconButton(onPressed: () {
        
      }, icon: const HeroIcon(HeroIcons.shoppingBag, color: Colors.white,),),
      Positioned(
        top: 25,
        left: 25,
        child: Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isCart?Colors.red:Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text('2', style: TextStyle(color: isCart?Colors.white:Colors.black)),
      ),),
    ],
  );
}