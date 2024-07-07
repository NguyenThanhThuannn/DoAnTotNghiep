import 'package:json_annotation/json_annotation.dart';

import '../../orderpage/data/model/order_response_model.dart';

part 'shipping_method_response_model.g.dart';

@JsonSerializable()
class ShippingMethodResponse {
  ShippingMethodResponse({
    this.code,
    this.message,
    required this.data,
  });
  int ? code;
  String ? message;
  List<ShippingMethodModel> data;
  factory ShippingMethodResponse.fromJson(Map<String,dynamic> json) => _$ShippingMethodResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShippingMethodResponseToJson(this);
}