import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../homepage/data/models/product_response_model.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../../loginregisterpage/domain/entities/user.dart';
import '../../domain/entities/order.dart';

part 'order_response_model.g.dart';

@JsonSerializable()
class OrderResponseModel{
  OrderResponseModel({
    this.code,
    this.message,
    required this.data,
  });

  factory OrderResponseModel.fromJson(final Map<String,dynamic> json) => _$OrderResponseModelFromJson(json);
  int?code;
  String? message;
  List<OrderModel> data;
  Map<String,dynamic> toJson() => _$OrderResponseModelToJson(this);
}

@JsonSerializable()
class OrderModel extends OrderEntity{
  OrderModel({
    this.id,
    this.user_id,
    this.order_date,
    this.payment_method_id,
    this.shipping_address,
    this.shipping_method,
    this.order_total,
    this.order_status,
    this.created_at,
    this.updated_at,
    this.order_lines,
    this.order_statuses,
    this.payment_method_ids,
    this.shipping_addresses,
    this.shipping_methods,
  });
  factory OrderModel.fromJson(final Map<String,dynamic> json) => _$OrderModelFromJson(json);
  @override
  int ? id;
  @override
  int ? user_id;
  @override
  String ? order_date;
  @override
  int? payment_method_id;
  @override
  int ? shipping_address;
  @override
  int ? shipping_method;
  @override
  String ? order_total;
  @override
  int ? order_status;
  @override
  String ? created_at;
  @override
  String ? updated_at;
  @override
  List<OrderLines> ? order_lines;
  @override
  OrderStatusModel? order_statuses;
  @override
  ShippingMethodModel ? shipping_methods;
  @override
  ShippingAddressModel ? shipping_addresses;
  @override
  PaymentMethodModel ? payment_method_ids;
  Map<String,dynamic> toJson() => _$OrderModelToJson(this);
}

@JsonSerializable()
class OrderLines extends ProductEntity{
  OrderLines({
    this.id,
    this.order_id,
    this.product_item_id,
    this.qty,
    this.price,
    this.created_at,
    this.updated_at,
    this.user_review,
  });
  factory OrderLines.fromJson(final Map<String,dynamic> json) => _$OrderLinesFromJson(json);
  @override
  int ? id;
  @override
  int ? product_item_id;
  @override
  int ? order_id;
  @override
  int ? qty;
  @override
  String ? price;
  @override
  String ? created_at;
  @override
  String ? updated_at;
  @override
  UserReviewModel ? user_review;
  Map<String,dynamic> toJson() => _$OrderLinesToJson(this);
}

@JsonSerializable()
class UserReviewModel extends UserReview{
  UserReviewModel({
    this.id,
      this.user_id,
      this.ordered_product_id,
      this.rating_value,
      this.comment,
      this.created_at,
      this.updated_at,
  });
  factory UserReviewModel.fromJson(final Map<String,dynamic> json) => _$UserReviewModelFromJson(json);
  @override
  int? id;
  @override
  int? user_id;
  @override
  int? ordered_product_id;
  @override
  int? rating_value;
  @override
  String? comment;
  @override
  String? created_at;
  @override
  String? updated_at;
  Map<String,dynamic> toJson() => _$UserReviewModelToJson(this);
}


@JsonSerializable()
class OrderStatusModel extends OrderStatusEntity{
  OrderStatusModel({
    this.id,
    this.status,
    this.created_at,
    this.updated_at,
  });
  factory OrderStatusModel.fromJson(final Map<String,dynamic> json) => _$OrderStatusModelFromJson(json);
  @override
  int ? id;
  @override
  String ? status;
  @override
  String ? created_at;
  @override
  String ? updated_at;
  Map<String,dynamic> toJson() => _$OrderStatusModelToJson(this);
}

@JsonSerializable()
class ShippingMethodModel extends ShippingMethodEntity{
  ShippingMethodModel({
    this.id,
    this.name,
    this.price,
    this.created_at,
    this.updated_at,
  });
  factory ShippingMethodModel.fromJson(final Map<String,dynamic> json) => _$ShippingMethodModelFromJson(json);
  @override
  int ? id;
  @override
  String ? name;
  @override
  String ? price;
  @override
  String ? created_at;
  @override
  String ? updated_at;
  Map<String,dynamic> toJson() => _$ShippingMethodModelToJson(this);
}

@JsonSerializable()
class ShippingAddressModel extends Address{
  ShippingAddressModel({
    this.id,
    this.address_line,
    this.is_default,
    this.city,
    this.country_id,
    this.created_at,
    this.updated_at,
  });
  factory ShippingAddressModel.fromJson(final Map<String,dynamic> json) => _$ShippingAddressModelFromJson(json);
  @override
  int ? id;
  @override
  String ? address_line;
  @override
  int ? is_default;
  @override
  String ? city;
  @override
  int ? country_id;
  @override
  String ? created_at;
  @override
  String ? updated_at;
  Map<String,dynamic> toJson() => _$ShippingAddressModelToJson(this);
}

@JsonSerializable()
class PaymentMethodModel extends PaymentMethodEntity{
  PaymentMethodModel({
    this.id,
    this.user_id,
    this.payment_type_id,
    this.provider,
    this.account_number,
    this.expiry_date,
    this.is_default,
    this.created_at,
    this.updated_at,
  });
  factory PaymentMethodModel.fromJson(final Map<String,dynamic> json) => _$PaymentMethodModelFromJson(json);
  @override
  int ? id;
  @override
  int ? user_id;
  @override
  int ? payment_type_id;
  @override
  String ? provider;
  @override
  String ? account_number;
  @override
  String ? expiry_date;
  @override
  int ? is_default;
  @override
  String ? created_at;
  @override
  String ? updated_at;
  Map<String,dynamic> toJson() => _$PaymentMethodModelToJson(this);
}

/* class OrderLine {
  final int user_id;
  final int product_item_id;
  final int qty;
  final String price;
  OrderLine({
    required this.user_id,
    required this.product_item_id,
    required this.qty,
    required this.price,
  });
  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'price': price,
      'product_item_id': product_item_id,
      'qty': qty,
    };
  }
} */