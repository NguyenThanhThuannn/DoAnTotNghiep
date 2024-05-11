// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermResponseModel _$TermResponseModelFromJson(Map<String, dynamic> json) =>
    TermResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: TermModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TermResponseModelToJson(TermResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

TermModel _$TermModelFromJson(Map<String, dynamic> json) => TermModel(
      term: (json['term'] as List<dynamic>)
          .map((e) => TermItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TermModelToJson(TermModel instance) => <String, dynamic>{
      'term': instance.term,
    };

TermItemModel _$TermItemModelFromJson(Map<String, dynamic> json) =>
    TermItemModel(
      title: json['title'] as String,
      item: (json['item'] as List<dynamic>?)
          ?.map((e) => TermDataItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TermItemModelToJson(TermItemModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'item': instance.item,
    };

TermDataItemModel _$TermDataItemModelFromJson(Map<String, dynamic> json) =>
    TermDataItemModel(
      title: json['title'] as String,
    );

Map<String, dynamic> _$TermDataItemModelToJson(TermDataItemModel instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
