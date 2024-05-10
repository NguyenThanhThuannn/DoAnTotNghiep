import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/policy.dart';
part 'policy_response_model.g.dart';
@JsonSerializable()
class PolicyResponseModel{
  PolicyResponseModel({
    this.code,
    this.message,
    required this.data,
  });
  int? code;
  String? message;
  PolicyModel data;
  factory PolicyResponseModel.fromJson(Map<String, dynamic> json) => _$PolicyResponseModelFromJson(json);
  Map<String, dynamic> toJson()=> _$PolicyResponseModelToJson(this);
}

@JsonSerializable()
class PolicyModel{
  PolicyModel({
    required this.policy,
  });
  List<PolicyItemModel> policy;
  factory PolicyModel.fromJson(Map<String, dynamic> json) => _$PolicyModelFromJson(json);
  Map<String, dynamic> toJson()=> _$PolicyModelToJson(this);
}

@JsonSerializable()
class PolicyItemModel extends PolicyItemEntity{
  PolicyItemModel({
    required this.title,
    required this.item,
  });
  @override
  String title;
  @override
  List<ItemModel> ? item;
  factory PolicyItemModel.fromJson(Map<String, dynamic> json) => _$PolicyItemModelFromJson(json);
  Map<String, dynamic> toJson()=> _$PolicyItemModelToJson(this);
}

@JsonSerializable()
class ItemModel extends ItemEntity{
  ItemModel({
    required this.title,
  });
  @override
  String title;
  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);
  Map<String, dynamic> toJson()=> _$ItemModelToJson(this);
}