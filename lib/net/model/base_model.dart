import 'package:json_annotation/json_annotation.dart';
part 'base_model.g.dart';
@JsonSerializable(genericArgumentFactories: true)
class BaseModel<T> {
  T? data;
  int? errorCode;
  String? errorMsg;
  BaseModel({this.data, this.errorCode, this.errorMsg});

  factory BaseModel.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic json) fromJsonT,
      ) =>
      _$BaseModelFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseModelToJson<T>(this, toJsonT);

}
