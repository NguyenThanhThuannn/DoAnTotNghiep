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
    );

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
      city: json['city'] as String?,
      country_id: json['country_id'] as int?,
    );

Map<String, dynamic> _$AddressesToJson(Addresses instance) => <String, dynamic>{
      'id': instance.id,
      'address_line': instance.address_line,
      'is_default': instance.is_default,
      'city': instance.city,
      'country_id': instance.country_id,
    };
