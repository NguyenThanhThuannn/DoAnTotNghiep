// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_method_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingMethodResponse _$ShippingMethodResponseFromJson(
        Map<String, dynamic> json) =>
    ShippingMethodResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => ShippingMethodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShippingMethodResponseToJson(
        ShippingMethodResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
