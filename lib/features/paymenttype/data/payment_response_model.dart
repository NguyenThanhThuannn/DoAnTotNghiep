import 'package:json_annotation/json_annotation.dart';

import '../domain/payment_entity.dart';

part 'payment_response_model.g.dart';

@JsonSerializable()
class PaymentResponseModel{
  PaymentResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  factory PaymentResponseModel.fromJson(final Map<String, dynamic> json)=>_$PaymentResponseModelFromJson(json);
  int? code;
  String? message;
  List<PaymentModel> data;
  Map<String, dynamic> toJson() => _$PaymentResponseModelToJson(this);
}

@JsonSerializable()
class PaymentModel extends PaymentEntity {
  const PaymentModel({
    this.id,
    this.value,
    this.created_at,
    this.updated_at,
  });
  factory PaymentModel.fromJson(final Map<String, dynamic> json)=>_$PaymentModelFromJson(json);
  @override
  final int? id;
  @override
  final String? value;
  @override
  final String? created_at;
  @override
  final String? updated_at;
  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);
}