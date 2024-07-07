// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) =>
    UserResponseModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      email_verified_at: json['email_verified_at'] as String?,
      phone_number: json['phone_number'] as String?,
      remember_token: json['remember_token'] as String?,
      user_image: json['user_image'] as String?,
      role: json['role'] as String?,
      password: json['password'] as String?,
      password_confirmation: json['password_confirmation'] as String?,
      token: json['token'] as String?,
      user_addresses: json['user_addresses'] == null
          ? null
          : UserAddresses.fromJson(
              json['user_addresses'] as Map<String, dynamic>),
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Addresses.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..shopping_cart = json['shopping_cart'] == null
        ? null
        : ShoppingCart.fromJson(json['shopping_cart'] as Map<String, dynamic>);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.email_verified_at,
      'phone_number': instance.phone_number,
      'remember_token': instance.remember_token,
      'user_image': instance.user_image,
      'role': instance.role,
      'password': instance.password,
      'password_confirmation': instance.password_confirmation,
      'token': instance.token,
      'user_addresses': instance.user_addresses,
      'addresses': instance.addresses,
      'shopping_cart': instance.shopping_cart,
    };

UserAddresses _$UserAddressesFromJson(Map<String, dynamic> json) =>
    UserAddresses(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      address_id: json['address_id'] as String?,
    );

Map<String, dynamic> _$UserAddressesToJson(UserAddresses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'address_id': instance.address_id,
    };

Addresses _$AddressesFromJson(Map<String, dynamic> json) => Addresses(
      id: json['id'] as int?,
      address_line: json['address_line'] as String?,
      is_default: json['is_default'] as int?,
      country_id: json['country_id'] as int?,
    );

Map<String, dynamic> _$AddressesToJson(Addresses instance) => <String, dynamic>{
      'id': instance.id,
      'address_line': instance.address_line,
      'is_default': instance.is_default,
      'country_id': instance.country_id,
    };

ShoppingCart _$ShoppingCartFromJson(Map<String, dynamic> json) => ShoppingCart(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ShoppingCartItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ShoppingCartToJson(ShoppingCart instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'items': instance.items,
    };

ShoppingCartItems _$ShoppingCartItemsFromJson(Map<String, dynamic> json) =>
    ShoppingCartItems(
      id: json['id'] as int?,
      cart_id: json['cart_id'] as int?,
      product_item_id: json['product_item_id'] as int?,
      product_image: json['product_image'] as String?,
      qty: json['qty'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      product: json['product'] == null
          ? null
          : ProductItemsModel.fromJson(json['product'] as Map<String, dynamic>),
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
      ..order_id = json['order_id'] as int?
      ..user_review = json['user_review'] == null
          ? null
          : UserReviewModel.fromJson(
              json['user_review'] as Map<String, dynamic>);

Map<String, dynamic> _$ShoppingCartItemsToJson(ShoppingCartItems instance) =>
    <String, dynamic>{
      'colors': instance.colors,
      'sizes': instance.sizes,
      'storage': instance.storage,
      'ram': instance.ram,
      'material': instance.material,
      'product_item': instance.product_item,
      'category': instance.category,
      'order_id': instance.order_id,
      'user_review': instance.user_review,
      'id': instance.id,
      'cart_id': instance.cart_id,
      'product_item_id': instance.product_item_id,
      'product_image': instance.product_image,
      'qty': instance.qty,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'product': instance.product,
    };
