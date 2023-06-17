import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'home_banner_model.g.dart';
@JsonSerializable()
class HomeBannerModel {
	late String desc;
	late int id;
	late String imagePath;
	late int isVisible;
	late int order;
	late String title;
	late int type;
	late String url;

	HomeBannerModel();

	factory HomeBannerModel.fromJson(Map<String, dynamic> json) => _$HomeBannerModelFromJson(json);

	Map<String, dynamic> toJson() => _$HomeBannerModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}