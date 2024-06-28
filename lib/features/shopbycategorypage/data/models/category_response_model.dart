import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/category.dart';

part 'category_response_model.g.dart';

@JsonSerializable()
class CategoryResponseModel {
  CategoryResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  factory CategoryResponseModel.fromJson(final Map<String, dynamic> json) => _$CategoryResponseModelFromJson(json);
  int? code;
  String? message;
  List<CategoryModel> data;
  Map<String, dynamic> toJson() => _$CategoryResponseModelToJson(this);
}

@JsonSerializable()
class CategoryModel extends CategoryEntity{
  CategoryModel({
    this.id,
    this.parent_category_id,
    this.category_name,
    this.created_at,
    this.updated_at,
  });
  factory CategoryModel.fromJson(final Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  @override
  int ? id;
  @override
  int ? parent_category_id;
  @override
  String ? category_name;
  @override
  String ? created_at;
  @override
  String ? updated_at;
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}