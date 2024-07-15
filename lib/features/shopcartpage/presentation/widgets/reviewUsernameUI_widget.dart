import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../config/constaint.dart';
import '../../../../network/end_points.dart';
import '../../../reviewpage/domain/review.dart';

class ReviewUsernameUI extends StatelessWidget {
  ReviewUsernameUI({super.key, required this.review});
  ReviewEntity review;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                minRadius: 20,
                maxRadius: 20,
                child: CachedNetworkImage(
                    imageUrl: review.user_review!.user_id!.user_image?[0] == 'i'
                        ? '${EndPoints.urlImage}${review.user_review!.user_id!.user_image!}'
                        : kDefaultImage,
                    imageBuilder: (final context, final imageProvider) {
                      return Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width / 2,
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
                          height: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.08),),
                          child: const CupertinoActivityIndicator(),
                        ),
                      );
                    },
                    errorWidget: (final context, final url, final error) {
                      return Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.width / 2,
                        color: Colors.black.withOpacity(0.04),
                      );
                    },
                  ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(review.user_review!.user_id!.name!),
            ],
          ),
          RatingBar.builder(
            itemSize: 24,
            ignoreGestures: true,
            initialRating: review.user_review!.rating_value!.toDouble(),
            minRating: 1,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (final context, final _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (final rating) {
            },
          ),
          Text(
            textAlign: TextAlign.justify,
            '${review.user_review!.comment}',
          ),
        ],
      ),
    );
  }
}