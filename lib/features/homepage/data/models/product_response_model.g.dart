// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponseModel _$ProductResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseModelToJson(
        ProductResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as int?,
      category_id: json['category_id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      product_image: json['product_image'] as String?,
      create_at: json['create_at'] as String?,
      update_at: json['update_at'] as String?,
      type: json['type'] as String?,
      product_item: json['product_item'] == null
          ? null
          : ProductItemsModel.fromJson(
              json['product_item'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : ProductCategoryModel.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.category_id,
      'name': instance.name,
      'description': instance.description,
      'product_image': instance.product_image,
      'create_at': instance.create_at,
      'update_at': instance.update_at,
      'type': instance.type,
      'product_item': instance.product_item,
      'category': instance.category,
    };

ProductItemsModel _$ProductItemsModelFromJson(Map<String, dynamic> json) =>
    ProductItemsModel(
      id: json['id'] as int?,
      product_id: json['product_id'] as int?,
      SKU: json['SKU'] as int?,
      qty_in_stock: json['qty_in_stock'] as int?,
      product_image: json['product_image'] as String?,
      price: json['price'] as String?,
      create_at: json['create_at'] as String?,
      update_at: json['update_at'] as String?,
      rating: json['rating'] as int?,
    )
      ..product_item = json['product_item'] == null
          ? null
          : ProductItemsModel.fromJson(
              json['product_item'] as Map<String, dynamic>)
      ..category = json['category'] == null
          ? null
          : ProductCategoryModel.fromJson(
              json['category'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductItemsModelToJson(ProductItemsModel instance) =>
    <String, dynamic>{
      'product_item': instance.product_item,
      'category': instance.category,
      'id': instance.id,
      'product_id': instance.product_id,
      'SKU': instance.SKU,
      'qty_in_stock': instance.qty_in_stock,
      'product_image': instance.product_image,
      'price': instance.price,
      'create_at': instance.create_at,
      'update_at': instance.update_at,
      'rating': instance.rating,
    };

ProductCategoryModel _$ProductCategoryModelFromJson(
        Map<String, dynamic> json) =>
    ProductCategoryModel(
      id: json['id'] as int?,
      parent_category_id: json['parent_category_id'] as int?,
      category_name: json['category_name'] as String?,
      create_at: json['create_at'] as String?,
      update_at: json['update_at'] as String?,
    )
      ..product_item = json['product_item'] == null
          ? null
          : ProductItemsModel.fromJson(
              json['product_item'] as Map<String, dynamic>)
      ..category = json['category'] == null
          ? null
          : ProductCategoryModel.fromJson(
              json['category'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductCategoryModelToJson(
        ProductCategoryModel instance) =>
    <String, dynamic>{
      'product_item': instance.product_item,
      'category': instance.category,
      'id': instance.id,
      'parent_category_id': instance.parent_category_id,
      'category_name': instance.category_name,
      'create_at': instance.create_at,
      'update_at': instance.update_at,
    };
