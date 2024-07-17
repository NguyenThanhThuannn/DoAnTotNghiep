import 'package:equatable/equatable.dart';

import '../../homepage/data/models/product_response_model.dart';
import '../data/favourite_response_model.dart';

class FavouriteEntity extends Equatable{
  FavouriteEntity({
    this.id,
    this.user_id,
    this.is_default,
    this.product_id,
    this.created_at,
    this.updated_at,
  });
  final int ? id;
  final int ? user_id;
  final int ? is_default;
  FavouriteProductModel ? product_id;
  final String ? created_at;
  final String ? updated_at;
  
  @override
  List<Object?> get props => [
    id,user_id,is_default,product_id,created_at,updated_at,
  ];
}