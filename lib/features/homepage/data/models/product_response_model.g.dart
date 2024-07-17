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
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      type: json['type'] as String?,
      colors: (json['colors'] as List<dynamic>?)
          ?.map((e) => ColorsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sizes: (json['sizes'] as List<dynamic>?)
          ?.map((e) => SizesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      storage: (json['storage'] as List<dynamic>?)
          ?.map((e) => StorageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ram: (json['ram'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      material: (json['material'] as List<dynamic>?)
          ?.map((e) => MaterialModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      product_item: json['product_item'] == null
          ? null
          : ProductItemsModel.fromJson(
              json['product_item'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : ProductCategoryModel.fromJson(
              json['category'] as Map<String, dynamic>),
    )
      ..product = json['product'] == null
          ? null
          : ProductItemsModel.fromJson(json['product'] as Map<String, dynamic>)
      ..order_id = json['order_id'] as int?
      ..user_review = json['user_review'] == null
          ? null
          : UserReviewModel.fromJson(
              json['user_review'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
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
      'colors': instance.colors,
      'sizes': instance.sizes,
      'storage': instance.storage,
      'ram': instance.ram,
      'material': instance.material,
      'product_item': instance.product_item,
      'category': instance.category,
    };

ColorsModel _$ColorsModelFromJson(Map<String, dynamic> json) => ColorsModel(
      name: json['name'] as String?,
      class_bg: json['class'] as String?,
      selectedClass: json['selectedClass'] as String?,
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

Map<String, dynamic> _$ColorsModelToJson(ColorsModel instance) =>
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
      'name': instance.name,
      'class': instance.class_bg,
      'selectedClass': instance.selectedClass,
    };

SizesModel _$SizesModelFromJson(Map<String, dynamic> json) => SizesModel(
      name: json['name'] as String?,
      inStock: json['inStock'] as bool?,
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

Map<String, dynamic> _$SizesModelToJson(SizesModel instance) =>
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
      'name': instance.name,
      'inStock': instance.inStock,
    };

StorageModel _$StorageModelFromJson(Map<String, dynamic> json) => StorageModel(
      name: json['name'] as String?,
      inStock: json['inStock'] as bool?,
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

Map<String, dynamic> _$StorageModelToJson(StorageModel instance) =>
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
      'name': instance.name,
      'inStock': instance.inStock,
    };

MaterialModel _$MaterialModelFromJson(Map<String, dynamic> json) =>
    MaterialModel(
      name: json['name'] as String?,
      inStock: json['inStock'] as bool?,
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

Map<String, dynamic> _$MaterialModelToJson(MaterialModel instance) =>
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
      'name': instance.name,
      'inStock': instance.inStock,
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
      rating: (json['rating'] as num?)?.toDouble(),
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

Map<String, dynamic> _$ProductItemsModelToJson(ProductItemsModel instance) =>
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

Map<String, dynamic> _$ProductCategoryModelToJson(
        ProductCategoryModel instance) =>
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
      'parent_category_id': instance.parent_category_id,
      'category_name': instance.category_name,
      'create_at': instance.create_at,
      'update_at': instance.update_at,
    };
