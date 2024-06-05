import 'package:json_annotation/json_annotation.dart';
import '../../../homepage/data/models/product_response_model.dart';
import '../../../homepage/domain/entities/product.dart';
import '../../domain/entities/category.dart';

part 'category_response_model.g.dart';

@JsonSerializable()
class CategoryResponseModel {
  CategoryResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  int? code;
  String? message;
  CategoryModel data;
  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) => _$CategoryResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseModelToJson(this);
}

@JsonSerializable()
class CategoryModel{
  CategoryModel({
    required this.category,
  });
  List<CategoryDataModel> category;
  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CategoryDataModel extends CategoryDataEntity{
  CategoryDataModel({
    required this.name,
    this.item,
  });
  @override
  String name;
  @override
  List<CategoryItemModel>? item;
  factory CategoryDataModel.fromJson(Map<String, dynamic> json) => _$CategoryDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDataModelToJson(this);
}

@JsonSerializable()
class CategoryItemModel{
  CategoryItemModel({
    required this.name,
    this.pro
  });
  String name;
  List<CategoryProductModel>? pro;
  factory CategoryItemModel.fromJson(Map<String, dynamic> json) => _$CategoryItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryItemModelToJson(this);
}
@JsonSerializable()
class CategoryProductModel extends ProductEntity {
  CategoryProductModel({
    required this.type,
    required this.price,
    required this.title,
    required this.price_sale,
    required this.tag,
    required this.status,
    required this.description,
    required this.subDesItem,
    required this.SKU,
    required this.pro,
    required this.relatePro,
  });
  @override
  String? type;
  @override
  String price;
  @override
  String title;
  @override
  String price_sale;
  @override
  String? tag;
  @override
  bool? status;
  @override
  String? description;
  @override
  List<SubDescriptionModel>? subDesItem;
  @override
  String? SKU;
  @override
  List<BundleProModel>? pro;
  @override
  List<RelateProModel>? relatePro;
  factory CategoryProductModel.fromJson(Map<String, dynamic> json) => _$CategoryProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryProductModelToJson(this);
}