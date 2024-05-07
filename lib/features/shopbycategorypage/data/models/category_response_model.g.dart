// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponseModel _$CategoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    CategoryResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: CategoryModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryResponseModelToJson(
        CategoryResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      category: (json['category'] as List<dynamic>)
          .map((e) => CategoryDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'category': instance.category,
    };

CategoryDataModel _$CategoryDataModelFromJson(Map<String, dynamic> json) =>
    CategoryDataModel(
      name: json['name'] as String,
      item: (json['item'] as List<dynamic>?)
          ?.map((e) => CategoryItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryDataModelToJson(CategoryDataModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'item': instance.item,
    };

CategoryItemModel _$CategoryItemModelFromJson(Map<String, dynamic> json) =>
    CategoryItemModel(
      name: json['name'] as String,
      pro: (json['pro'] as List<dynamic>?)
          ?.map((e) => CategoryProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryItemModelToJson(CategoryItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'pro': instance.pro,
    };

CategoryProductModel _$CategoryProductModelFromJson(
        Map<String, dynamic> json) =>
    CategoryProductModel(
      type: json['type'] as String?,
      price: json['price'] as String,
      title: json['title'] as String,
      price_sale: json['price_sale'] as String,
      tag: json['tag'] as String?,
      status: json['status'] as bool?,
      description: json['description'] as String?,
      subDesItem: (json['subDesItem'] as List<dynamic>?)
          ?.map((e) => SubDescriptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      SKU: json['SKU'] as String?,
      pro: (json['pro'] as List<dynamic>?)
          ?.map((e) => BundleProModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatePro: (json['relatePro'] as List<dynamic>?)
          ?.map((e) => RelateProModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryProductModelToJson(
        CategoryProductModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'price': instance.price,
      'title': instance.title,
      'price_sale': instance.price_sale,
      'tag': instance.tag,
      'status': instance.status,
      'description': instance.description,
      'subDesItem': instance.subDesItem,
      'SKU': instance.SKU,
      'pro': instance.pro,
      'relatePro': instance.relatePro,
    };
