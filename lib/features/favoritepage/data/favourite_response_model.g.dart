// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteResponseModel _$FavouriteResponseModelFromJson(
        Map<String, dynamic> json) =>
    FavouriteResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => FavouriteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FavouriteResponseModelToJson(
        FavouriteResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

FavouriteModel _$FavouriteModelFromJson(Map<String, dynamic> json) =>
    FavouriteModel(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      is_default: json['is_default'] as int?,
      product_id: json['product_id'] == null
          ? null
          : FavouriteProductModel.fromJson(
              json['product_id'] as Map<String, dynamic>),
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$FavouriteModelToJson(FavouriteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'is_default': instance.is_default,
      'product_id': instance.product_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

FavouriteProductModel _$FavouriteProductModelFromJson(
        Map<String, dynamic> json) =>
    FavouriteProductModel(
      id: json['id'] as int?,
      category_id: json['category_id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      product_image: json['product_image'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      type: json['type'] as String?,
    )
      ..colors = (json['colors'] as List<dynamic>?)
          ?.map((e) => ColorsModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..sizes = (json['sizes'] as List<dynamic>?)
          ?.map((e) => SizesModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..storage = (json['storage'] as List<dynamic>?)
          ?.map((e) => StorageModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..ram = (json['ram'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList()
      ..material = (json['material'] as List<dynamic>?)
          ?.map((e) => MaterialModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..product_item = json['product_item'] == null
          ? null
          : ProductItemsModel.fromJson(
              json['product_item'] as Map<String, dynamic>)
      ..category = json['category'] == null
          ? null
          : ProductCategoryModel.fromJson(
              json['category'] as Map<String, dynamic>)
      ..product = json['product'] == null
          ? null
          : ProductItemsModel.fromJson(json['product'] as Map<String, dynamic>)
      ..order_id = json['order_id'] as int?
      ..user_review = json['user_review'] == null
          ? null
          : UserReviewModel.fromJson(
              json['user_review'] as Map<String, dynamic>);

Map<String, dynamic> _$FavouriteProductModelToJson(
        FavouriteProductModel instance) =>
    <String, dynamic>{
      'colors': instance.colors,
      'sizes': instance.sizes,
      'storage': instance.storage,
      'ram': instance.ram,
      'material': instance.material,
      'product_item': instance.product_item,
      'category': instance.category,
      'product': instance.product,
      'order_id': instance.order_id,
      'user_review': instance.user_review,
      'id': instance.id,
      'category_id': instance.category_id,
      'name': instance.name,
      'description': instance.description,
      'product_image': instance.product_image,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'type': instance.type,
    };
