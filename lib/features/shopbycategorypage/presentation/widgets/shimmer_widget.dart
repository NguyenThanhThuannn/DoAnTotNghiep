import 'package:flutter/material.dart';

class Shimmer extends StatelessWidget {
  const Shimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              Sketon(width: 240,height: 240,),
              Sketon(width: 50,height: 20,)
            ],
          ),
        );
      },),
    );
  }
}
class ShimmerItem extends StatelessWidget {
  const ShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10,),
        Sketon(width: 130,height: 130,),
        SizedBox(width: 5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Sketon(width: 240,),
            SizedBox(height: 8,),
            Sketon(width: 240,),
            SizedBox(height: 8,),
            Sketon(width: 150,),
            SizedBox(height: 8,),
            Row(
              children: [
                Sketon(width: 120,),
                SizedBox(width: 8,),
                Sketon(width: 80,),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
class Sketon extends StatelessWidget {
  Sketon({
    super.key, this.height, this.width,
  });
  final double? height;
  final double? width;
  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(16),
      ),
      width: width,
      height: height,
    );
  }
}
