import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/faq.dart';

part 'faq_response_model.g.dart';
@JsonSerializable()
class FAQResponseModel{
  FAQResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  int? code;
  String? message;
  FAQModel data;
  factory FAQResponseModel.fromJson(Map<String, dynamic> json) => _$FAQResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$FAQResponseModelToJson(this);
}

@JsonSerializable()
class FAQModel{
  FAQModel({
    required this.FAQ,
  });
  List<FAQItemModel> FAQ;
  factory FAQModel.fromJson(Map<String, dynamic> json) => _$FAQModelFromJson(json);
  Map<String, dynamic> toJson() => _$FAQModelToJson(this);
}

@JsonSerializable()
class FAQItemModel extends FAQItemEntity{
  FAQItemModel({
    required this.title,
    required this.description,
  });
  @override
  String title;
  @override
  String description;
  factory FAQItemModel.fromJson(Map<String, dynamic> json) => _$FAQItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$FAQItemModelToJson(this);
}