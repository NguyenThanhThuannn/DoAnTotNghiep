// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQResponseModel _$FAQResponseModelFromJson(Map<String, dynamic> json) =>
    FAQResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: FAQModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FAQResponseModelToJson(FAQResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

FAQModel _$FAQModelFromJson(Map<String, dynamic> json) => FAQModel(
      FAQ: (json['FAQ'] as List<dynamic>)
          .map((e) => FAQItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FAQModelToJson(FAQModel instance) => <String, dynamic>{
      'FAQ': instance.FAQ,
    };

FAQItemModel _$FAQItemModelFromJson(Map<String, dynamic> json) => FAQItemModel(
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$FAQItemModelToJson(FAQItemModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
