import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  UserResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  factory UserResponseModel.fromJson(final Map<String, dynamic> json)=>_$UserResponseModelFromJson(json);
  int ? code;
  String ? message;
  UserModel data;
  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}

@JsonSerializable()
class UserModel extends User {
  UserModel(
      {this.id,
      this.name,
      this.email,
      this.email_verified_at,
      this.phone_number,
      this.remember_token,
      this.user_image,
      this.role,
      this.password,
      this.password_confirmation,
      this.token,
      this.user_addresses,
      this.addresses,
      });

  factory UserModel.fromJson(final Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? email_verified_at;
  @override
  final String? phone_number;
  @override
  final String ? remember_token;
  @override
  final String? user_image;
  @override
  final String? role;
  @override
  final String? password;
  @override
  final String? password_confirmation;
  @override
  final String? token;
  @override
  UserAddresses? user_addresses;
  @override
  List<Addresses>? addresses;
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class UserAddresses extends Address{
  UserAddresses({
    this.id,
    this.user_id,
    this.address_id,
  });
  factory UserAddresses.fromJson(final Map<String, dynamic> json) =>
      _$UserAddressesFromJson(json);
  @override
  int ? id;
  @override
  int ? user_id;
  @override
  String ? address_id;
      Map<String, dynamic> toJson() => _$UserAddressesToJson(this);
}

@JsonSerializable()
class Addresses extends Address{
  Addresses({
    this.id,
    this.address_line,
    this.is_default,
    this.city,
    this.country_id,
  });
  factory Addresses.fromJson(final Map<String, dynamic> json) =>
      _$AddressesFromJson(json);
  @override
  int ? id;
  @override
  String ? address_line;
  int ? is_default;
  @override
  String ? city;
  @override
  int ? country_id;
      Map<String, dynamic> toJson() => _$AddressesToJson(this);
}