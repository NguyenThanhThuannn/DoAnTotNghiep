import 'package:equatable/equatable.dart';

import '../../data/model/user_model.dart';

class User extends Equatable {
  const User({
    this.id,
    this.name,
    this.email,
    this.email_verified_at,
    this.password,
    this.password_confirmation,
    this.token,
    this.phone_number,
    this.remember_token,
    this.user_image,
    this.role,
    this.user_addresses,
    this.addresses,
  });
  final int? id;
  final String? name;
  final String? email;
  final String? email_verified_at;
  final String? password;
  final String? password_confirmation;
  final String? token;
  final String? phone_number;
  final String? remember_token;
  final String? user_image;
  final String ? role;
  final UserAddresses? user_addresses;
  final List<Addresses>? addresses;

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        email_verified_at,
        password,
        password_confirmation,
        token,
        phone_number,
        remember_token,
        user_image,
        role,
        user_addresses,
        addresses,
      ];
}

class Address extends Equatable {
  const Address({
    this.id,
    this.user_id,
    this.address_line,
    this.address_id,
    this.is_default,
    this.created_at,
    this.updated_at,
    this.city,
    this.country_id,
  });
  final int? id;
  final int? user_id;
  final String? address_id;
  final int ? is_default;
  final String? created_at;
  final String? updated_at;
  final String? address_line;
  final String? city;
  final int? country_id;
  @override
  List<Object?> get props => [
        id,
        user_id,
        address_id,
        address_line,
        is_default,
        created_at,
        updated_at,
        city,
        country_id,
      ];
}
