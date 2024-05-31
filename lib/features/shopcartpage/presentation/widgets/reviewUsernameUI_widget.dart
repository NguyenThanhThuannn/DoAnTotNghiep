import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewUsernameUI extends StatelessWidget {
  ReviewUsernameUI({super.key, required this.star});
  double star;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/img/dragon.png'),
            ),
            SizedBox(
              width: 10,
            ),
            Text('John SEO'),
          ],
        ),
        RatingBar.builder(
          itemSize: 24,
          ignoreGestures: true,
          initialRating: star,
          minRating: 1,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (final context, final _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (final rating) {
          },
        ),
        const Text(
          textAlign: TextAlign.justify,
          'Rating start not changed as per rating attribute...Rating start not changed as per rating attribute...Rating start not changed as per rating attribute...Rating start not changed as per rating attribute...',
        ),
      ],
    );
  }
}