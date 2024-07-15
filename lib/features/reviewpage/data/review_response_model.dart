import 'package:json_annotation/json_annotation.dart';

import '../../loginregisterpage/data/model/user_model.dart';
import '../../orderpage/data/model/order_response_model.dart';
import '../domain/review.dart';

part 'review_response_model.g.dart';

@JsonSerializable()
class ReviewResponseModel{
  ReviewResponseModel({
    this.code,
    this.message,
    required this.data
  });
  int ? code;
  String ? message;
  List<ReviewModel> data;
  factory ReviewResponseModel.fromJson(Map<String, dynamic> json) => _$ReviewResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewResponseModelToJson(this);
}

@JsonSerializable()
class ReviewModel extends ReviewEntity{
  ReviewModel({
    this.id,
    this.product_item_id,
    this.order_id,
    this.qty,
    this.price,
    this.user_review
  });
  int? id;
  int? product_item_id;
  int? order_id;
  int? qty;
  String? price;
  String? created_at;
  String? updated_at;
  UserReviewModel1? user_review;
  factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}

@JsonSerializable()
class UserReviewModel1 {
  UserReviewModel1({
    this.id,
    this.user_id,
    this.ordered_product_id,
    this.rating_value,
    this.comment,
    this.created_at,
    this.updated_at
  });
  int? id;
  UserModel? user_id;
  int? ordered_product_id;
  int? rating_value;
  String? comment;
  String? created_at;
  String? updated_at;
  factory UserReviewModel1.fromJson(Map<String, dynamic> json) => _$UserReviewModel1FromJson(json);
  Map<String, dynamic> toJson() => _$UserReviewModel1ToJson(this);
}