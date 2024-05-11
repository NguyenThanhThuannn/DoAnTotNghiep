import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/term.dart';

part 'term_response_model.g.dart';
@JsonSerializable()
class TermResponseModel{
  TermResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  factory TermResponseModel.fromJson(final Map<String, dynamic> json) => _$TermResponseModelFromJson(json);
  int? code;
  String? message;
  TermModel data;
  Map<String, dynamic> toJson()=> _$TermResponseModelToJson(this);
}

@JsonSerializable()
class TermModel{
  TermModel({
    required this.term,
  });
  factory TermModel.fromJson(final Map<String, dynamic> json) => _$TermModelFromJson(json);
  List<TermItemModel> term;
  Map<String, dynamic> toJson()=> _$TermModelToJson(this);
}

@JsonSerializable()
class TermItemModel extends TermItemEntity{
  TermItemModel({
    required this.title,
    required this.item,
  });
  factory TermItemModel.fromJson(final Map<String, dynamic> json) => _$TermItemModelFromJson(json);
  @override
  String title;
  @override
  List<TermDataItemModel> ? item;
  Map<String, dynamic> toJson()=> _$TermItemModelToJson(this);
}

@JsonSerializable()
class TermDataItemModel extends TermDataItemEntity{
  TermDataItemModel({
    required this.title,
  });
  factory TermDataItemModel.fromJson(final Map<String, dynamic> json) => _$TermDataItemModelFromJson(json);
  @override
  String title;
  Map<String, dynamic> toJson()=> _$TermDataItemModelToJson(this);
}