
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';
@JsonSerializable()
class UserModel{
  UserModel();
  factory UserModel.fromJson(Map<String,dynamic> json)=> _$UserModelFromJson(json);
  Map<String,dynamic> tojson()=> _$UserModelToJson(this);

}