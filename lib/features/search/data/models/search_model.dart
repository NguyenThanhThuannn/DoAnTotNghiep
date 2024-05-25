import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/search.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchResponseModel {
  SearchResponseModel({
    this.code,
    this.message,
    required this.data,
  });

  factory SearchResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$SearchResponseModelFromJson(json);
  int? code;
  String? message;
  SearchModel data;
  Map<String, dynamic> toJson() => _$SearchResponseModelToJson(this);
}

@Entity(tableName: 'search_product', primaryKeys: ['id'])
@JsonSerializable()
class SearchModel extends SearchEntity {
  SearchModel({
    this.id,
    this.title,
  });

  factory SearchModel.fromJson(final Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  factory SearchModel.fromEntity(final SearchEntity entity) {
    return SearchModel(
      id: entity.id,
      title: entity.title,
    );
  }
  @override
  int? id;
  @override
  String? title;
  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}
