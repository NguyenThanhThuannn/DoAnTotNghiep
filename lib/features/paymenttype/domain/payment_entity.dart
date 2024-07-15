import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

class PaymentEntity extends Equatable{
  const PaymentEntity({
    this.id,
    this.value,
    this.created_at,
    this.updated_at,
  });
  final int? id;
  final String? value;
  final String? created_at;
  final String? updated_at;
  
  @override
  List<Object?> get props => [
    id,
    value,
    created_at,
    updated_at,
  ];
}