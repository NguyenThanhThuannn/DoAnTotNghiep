// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponseModel _$OrderResponseModelFromJson(Map<String, dynamic> json) =>
    OrderResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderResponseModelToJson(OrderResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      order_date: json['order_date'] as String?,
      payment_method_id: json['payment_method_id'] as int?,
      shipping_address: json['shipping_address'] as int?,
      shipping_method: json['shipping_method'] as int?,
      order_total: json['order_total'] as String?,
      order_status: json['order_status'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      order_lines: (json['order_lines'] as List<dynamic>?)
          ?.map((e) => OrderLines.fromJson(e as Map<String, dynamic>))
          .toList(),
      order_statuses: json['order_statuses'] == null
          ? null
          : OrderStatusModel.fromJson(
              json['order_statuses'] as Map<String, dynamic>),
      payment_method_ids: json['payment_method_ids'] == null
          ? null
          : PaymentMethodModel.fromJson(
              json['payment_method_ids'] as Map<String, dynamic>),
      shipping_addresses: json['shipping_addresses'] == null
          ? null
          : ShippingAddressModel.fromJson(
              json['shipping_addresses'] as Map<String, dynamic>),
      shipping_methods: json['shipping_methods'] == null
          ? null
          : ShippingMethodModel.fromJson(
              json['shipping_methods'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'order_date': instance.order_date,
      'payment_method_id': instance.payment_method_id,
      'shipping_address': instance.shipping_address,
      'shipping_method': instance.shipping_method,
      'order_total': instance.order_total,
      'order_status': instance.order_status,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'order_lines': instance.order_lines,
      'order_statuses': instance.order_statuses,
      'shipping_methods': instance.shipping_methods,
      'shipping_addresses': instance.shipping_addresses,
      'payment_method_ids': instance.payment_method_ids,
    };

OrderLines _$OrderLinesFromJson(Map<String, dynamic> json) => OrderLines(
      id: json['id'] as int?,
      order_id: json['order_id'] as int?,
      product_item_id: json['product_item_id'] as int?,
      qty: json['qty'] as int?,
      price: json['price'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      user_review: json['user_review'] == null
          ? null
          : UserReviewModel.fromJson(
              json['user_review'] as Map<String, dynamic>),
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
          : ProductItemsModel.fromJson(json['product'] as Map<String, dynamic>);

Map<String, dynamic> _$OrderLinesToJson(OrderLines instance) =>
    <String, dynamic>{
      'colors': instance.colors,
      'sizes': instance.sizes,
      'storage': instance.storage,
      'ram': instance.ram,
      'material': instance.material,
      'product_item': instance.product_item,
      'category': instance.category,
      'product': instance.product,
      'id': instance.id,
      'product_item_id': instance.product_item_id,
      'order_id': instance.order_id,
      'qty': instance.qty,
      'price': instance.price,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'user_review': instance.user_review,
    };

UserReviewModel _$UserReviewModelFromJson(Map<String, dynamic> json) =>
    UserReviewModel(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      ordered_product_id: json['ordered_product_id'] as int?,
      rating_value: json['rating_value'] as int?,
      comment: json['comment'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UserReviewModelToJson(UserReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'ordered_product_id': instance.ordered_product_id,
      'rating_value': instance.rating_value,
      'comment': instance.comment,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

OrderStatusModel _$OrderStatusModelFromJson(Map<String, dynamic> json) =>
    OrderStatusModel(
      id: json['id'] as int?,
      status: json['status'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$OrderStatusModelToJson(OrderStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

ShippingMethodModel _$ShippingMethodModelFromJson(Map<String, dynamic> json) =>
    ShippingMethodModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ShippingMethodModelToJson(
        ShippingMethodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

ShippingAddressModel _$ShippingAddressModelFromJson(
        Map<String, dynamic> json) =>
    ShippingAddressModel(
      id: json['id'] as int?,
      address_line: json['address_line'] as String?,
      is_default: json['is_default'] as int?,
      city: json['city'] as String?,
      country_id: json['country_id'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ShippingAddressModelToJson(
        ShippingAddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address_line': instance.address_line,
      'is_default': instance.is_default,
      'city': instance.city,
      'country_id': instance.country_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

PaymentMethodModel _$PaymentMethodModelFromJson(Map<String, dynamic> json) =>
    PaymentMethodModel(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      payment_type_id: json['payment_type_id'] as int?,
      provider: json['provider'] as String?,
      account_number: json['account_number'] as String?,
      expiry_date: json['expiry_date'] as String?,
      is_default: json['is_default'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$PaymentMethodModelToJson(PaymentMethodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'payment_type_id': instance.payment_type_id,
      'provider': instance.provider,
      'account_number': instance.account_number,
      'expiry_date': instance.expiry_date,
      'is_default': instance.is_default,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
