import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import '../../data/model/order_response_model.dart';

class OrderEntity extends Equatable{
  OrderEntity({
    this.id,
    this.user_id,
    this.order_date,
    this.payment_method_id,
    this.shipping_address,
    this.shipping_method,
    this.order_total,
    this.order_status,
    this.created_at,
    this.updated_at,
    this.order_lines,
    this.order_statuses,
    this.payment_method_ids,
    this.shipping_addresses,
    this.shipping_methods,
  });
  int ? id;
  int ? user_id;
  String ? order_date;
  int? payment_method_id;
  int ? shipping_address;
  int ? shipping_method;
  String ? order_total;
  int ? order_status;
  String ? created_at;
  String ? updated_at;
  List<OrderLines> ? order_lines;
  OrderStatusModel ? order_statuses;
  ShippingMethodModel ? shipping_methods;
  ShippingAddressModel ? shipping_addresses;
  PaymentMethodModel ? payment_method_ids;
  
  @override
  List<Object?> get props =>[
    id,
    user_id,
    order_date,
    payment_method_id,
    shipping_address,
    shipping_method,
    order_total,
    order_status,
    created_at,
    updated_at,
    order_lines,
    order_statuses,
    payment_method_ids,
    shipping_addresses,
    shipping_methods,
  ];
}

class OrderStatusEntity extends Equatable{
  OrderStatusEntity({
    this.id,
    this.status,
    this.created_at,
    this.updated_at,
  });
  int ? id;
  String ? status;
  String ? created_at;
  String ? updated_at;
  
  @override
  List<Object?> get props => [
    id,
    status,
    created_at,
    updated_at,
  ];
}

class ShippingMethodEntity extends Equatable{
  ShippingMethodEntity({
    this.id,
    this.name,
    this.price,
    this.created_at,
    this.updated_at,
  });
  int ? id;
  String ? name;
  String ? price;
  String ? created_at;
  String ? updated_at;
  
  @override
  List<Object?> get props => [
    id,
    name,
    price,
    created_at,
    updated_at,
  ];
}

class PaymentMethodEntity extends Equatable{
  PaymentMethodEntity({
    this.id,
    this.user_id,
    this.payment_type_id,
    this.provider,
    this.account_number,
    this.expiry_date,
    this.is_default,
    this.created_at,
    this.updated_at,
  });
  int ? id;
  int ? user_id;
  int ? payment_type_id;
  String ? provider;
  String ? account_number;
  String ? expiry_date;
  int ? is_default;
  String ? created_at;
  String ? updated_at;
  
  @override
  List<Object?> get props => [
    id,
    user_id,
    payment_type_id,
    provider,
    account_number,
    expiry_date,
    is_default,
    created_at,
    updated_at,
  ];
}