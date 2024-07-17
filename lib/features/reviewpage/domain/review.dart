import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import '../data/review_response_model.dart';

class ReviewEntity extends Equatable{
  ReviewEntity({
    this.id,
    this.price,
    this.product_item_id,
    this.order_id,
    this.qty,
    this.created_at,
    this.updated_at,
    this.user_review
  });
  final int? id;
  final int? product_item_id;
  final int? order_id;
  final int? qty;
  final String? price;
  final String? created_at;
  final String? updated_at;
  final UserReviewModel1 ? user_review;
  @override
  List<Object?> get props => [
    id,
    product_item_id,
    order_id,
    qty,
    price,
    created_at,
    updated_at,
    user_review
  ];
}