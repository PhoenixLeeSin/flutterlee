import 'package:json_annotation/json_annotation.dart';
part 'banner_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BannerModel {
  List<BannerModelData> data;
  int code;
  int message;
  BannerModel({this.data, this.code, this.message});

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BannerModelData {
  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  BannerModelData({
    this.desc,
    this.id,
    this.imagePath,
    this.isVisible,
    this.order,
    this.title,
    this.type,
    this.url,
  });

  factory BannerModelData.fromJson(Map<String, dynamic> json) =>
      _$BannerModelDataFromJson(json);
  Map<String, dynamic> toJson() => _$BannerModelDataToJson(this);
}
