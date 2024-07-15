// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentResponseModel _$PaymentResponseModelFromJson(
        Map<String, dynamic> json) =>
    PaymentResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentResponseModelToJson(
        PaymentResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel(
      id: json['id'] as int?,
      value: json['value'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
