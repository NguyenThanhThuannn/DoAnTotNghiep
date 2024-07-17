import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/textStyle.dart';
import '../../../../injection_container.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../../homepage/presentation/bloc/home_page_bloc.dart';
import '../../../shopcartpage/presentation/widgets/reviewUsernameUI_widget.dart';
import '../../domain/review.dart';
import '../bloc/review_bloc.dart';

class ReviewScreen extends StatefulWidget {
  ReviewScreen({super.key, required this.productID});
  int productID;
  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(final BuildContext context) {
    return BlocProvider<ReviewBloc>(
      create: (final context) => sl()..add(GetReview(widget.productID)),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: const Icon(Icons.keyboard_arrow_left_outlined),
          ),
          title: Text(
            'Đánh giá',
            style: textStylePlusJakartaSansMedium14Height1point5,
          ),
        ),
        body: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (final context, final state) {
            if (state is HomePageLoaded) {
              final ProductEntity pro = state.products!.firstWhere(
                (final element) => element.id == widget.productID,
              );
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${pro.product_item!.rating}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 50,
                                ),
                              ),
                              const TextSpan(text: '/5'),
                            ],
                          ),
                        ),
                        /* Column(
                          children: [
                            
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: LinearProgressIndicator(
                                value: 0.1,
                                minHeight: 11,
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: LinearProgressIndicator(
                                value: 0.1,
                                minHeight: 11,
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ],
                        ), */
                      ],
                    ),
                    BlocBuilder<ReviewBloc, ReviewState>(
                      builder: (final context, final state) {
                        if (state is ReviewLoading) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                        if (state is ReviewLoaded) {
                          final List<ReviewEntity> review = state.review!
                              .where(
                                (final element) =>
                                    element.product_item_id == widget.productID,
                              )
                              .toList();
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2,
                            child: ListView.builder(
                              itemCount: review.length,
                              itemBuilder: (final context, final index) {
                                return ReviewUsernameUI(review: review[index]);
                              },
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
