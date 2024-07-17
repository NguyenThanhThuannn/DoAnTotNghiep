import 'package:json_annotation/json_annotation.dart';
import '../../orderpage/data/model/order_response_model.dart';
import '../../homepage/data/models/product_response_model.dart';
import '../../homepage/domain/entities/product.dart';
import '../domain/favourite.dart';


part 'favourite_response_model.g.dart';
@JsonSerializable()
class FavouriteResponseModel{
  FavouriteResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  factory FavouriteResponseModel.fromJson(final Map<String, dynamic> json) => _$FavouriteResponseModelFromJson(json);
  int ? code;
  String ? message;
  List<FavouriteModel> data;
  Map<String, dynamic> toJson() => _$FavouriteResponseModelToJson(this);
}

@JsonSerializable()
class FavouriteModel extends FavouriteEntity{
  FavouriteModel({
    this.id,
    this.user_id,
    this.is_default,
    this.product_id,
    this.created_at,
    this.updated_at,
  });
  factory FavouriteModel.fromJson(final Map<String, dynamic> json) => _$FavouriteModelFromJson(json);
  @override
  final int ? id;
  @override
  final int ? user_id;
  @override
  final int ? is_default;
  @override
  FavouriteProductModel ? product_id;
  @override
  final String ? created_at;
  @override
  final String ? updated_at;
  Map<String, dynamic> toJson() => _$FavouriteModelToJson(this);
}

@JsonSerializable()
class FavouriteProductModel extends ProductEntity{
  FavouriteProductModel({
    this.id,
    this.category_id,
    this.name,
    this.description,
    this.product_image,
    this.created_at,
    this.updated_at,
    this.type,
  });
  factory FavouriteProductModel.fromJson(final Map<String, dynamic> json) => _$FavouriteProductModelFromJson(json);
  @override
  int ? id;
  @override
  int ? category_id;
  @override
  String ? name;
  @override
  String ? description;
  @override
  String ? product_image;
  @override
  String ? created_at;
  @override
  String ? updated_at;
  @override
  String ? type;
  Map<String, dynamic> toJson() => _$FavouriteProductModelToJson(this);
}