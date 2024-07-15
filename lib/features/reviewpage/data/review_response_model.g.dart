// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewResponseModel _$ReviewResponseModelFromJson(Map<String, dynamic> json) =>
    ReviewResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewResponseModelToJson(
        ReviewResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      id: json['id'] as int?,
      product_item_id: json['product_item_id'] as int?,
      order_id: json['order_id'] as int?,
      qty: json['qty'] as int?,
      price: json['price'] as String?,
      user_review: json['user_review'] == null
          ? null
          : UserReviewModel1.fromJson(
              json['user_review'] as Map<String, dynamic>),
    )
      ..created_at = json['created_at'] as String?
      ..updated_at = json['updated_at'] as String?;

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_item_id': instance.product_item_id,
      'order_id': instance.order_id,
      'qty': instance.qty,
      'price': instance.price,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'user_review': instance.user_review,
    };

UserReviewModel1 _$UserReviewModel1FromJson(Map<String, dynamic> json) =>
    UserReviewModel1(
      id: json['id'] as int?,
      user_id: json['user_id'] == null
          ? null
          : UserModel.fromJson(json['user_id'] as Map<String, dynamic>),
      ordered_product_id: json['ordered_product_id'] as int?,
      rating_value: json['rating_value'] as int?,
      comment: json['comment'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UserReviewModel1ToJson(UserReviewModel1 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'ordered_product_id': instance.ordered_product_id,
      'rating_value': instance.rating_value,
      'comment': instance.comment,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
