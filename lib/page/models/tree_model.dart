import 'package:json_annotation/json_annotation.dart';
part 'tree_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TreeModel {
  List<TreeModelData> data;
  int code;
  int message;
  TreeModel({this.data, this.code, this.message});

  factory TreeModel.fromJson(Map<String, dynamic> json) =>
      _$TreeModelFromJson(json);
  Map<String, dynamic> toJson() => _$TreeModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TreeModelData {
  List<ChildrenData> children;
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;
  bool expanded;

  TreeModelData({
    this.children,
    this.courseId,
    this.id,
    this.name,
    this.order,
    this.parentChapterId,
    this.userControlSetTop,
    this.visible,
    this.expanded = false,
  });

  factory TreeModelData.fromJson(Map<String, dynamic> json) =>
      _$TreeModelDataFromJson(json);
  Map<String, dynamic> toJson() => _$TreeModelDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChildrenData {
  List<dynamic> children;
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;

  ChildrenData({
    this.children,
    this.courseId,
    this.id,
    this.name,
    this.order,
    this.parentChapterId,
    this.userControlSetTop,
    this.visible,
  });

  factory ChildrenData.fromJson(Map<String, dynamic> json) =>
      _$ChildrenDataFromJson(json);
  Map<String, dynamic> toJson() => _$ChildrenDataToJson(this);
}
