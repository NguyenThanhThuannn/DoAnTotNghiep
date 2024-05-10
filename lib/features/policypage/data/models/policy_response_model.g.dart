// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PolicyResponseModel _$PolicyResponseModelFromJson(Map<String, dynamic> json) =>
    PolicyResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: PolicyModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PolicyResponseModelToJson(
        PolicyResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

PolicyModel _$PolicyModelFromJson(Map<String, dynamic> json) => PolicyModel(
      policy: (json['policy'] as List<dynamic>)
          .map((e) => PolicyItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PolicyModelToJson(PolicyModel instance) =>
    <String, dynamic>{
      'policy': instance.policy,
    };

PolicyItemModel _$PolicyItemModelFromJson(Map<String, dynamic> json) =>
    PolicyItemModel(
      title: json['title'] as String,
      item: (json['item'] as List<dynamic>?)
          ?.map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PolicyItemModelToJson(PolicyItemModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'item': instance.item,
    };

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      title: json['title'] as String,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'title': instance.title,
    };
