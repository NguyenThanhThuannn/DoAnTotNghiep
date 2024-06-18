import 'package:json_annotation/json_annotation.dart';
part 'user_response_model.g.dart';
@JsonSerializable()
class UserModel{
  UserModel({
    this.id,
    this.email,
    this.password
  });
  int ? id;
  String ? email;
  String ? password;
  factory UserModel.fromJson(Map<String,dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson()=>_$UserModelToJson(this);
}