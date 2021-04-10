// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreeModel _$TreeModelFromJson(Map<String, dynamic> json) {
  return TreeModel(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : TreeModelData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    code: json['code'] as int,
    message: json['message'] as int,
  );
}

Map<String, dynamic> _$TreeModelToJson(TreeModel instance) => <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'code': instance.code,
      'message': instance.message,
    };

TreeModelData _$TreeModelDataFromJson(Map<String, dynamic> json) {
  return TreeModelData(
    children: (json['children'] as List)
        ?.map((e) =>
            e == null ? null : ChildrenData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    courseId: json['courseId'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    order: json['order'] as int,
    parentChapterId: json['parentChapterId'] as int,
    userControlSetTop: json['userControlSetTop'] as bool,
    visible: json['visible'] as int,
    expanded: json['expanded'] as bool,
  );
}

Map<String, dynamic> _$TreeModelDataToJson(TreeModelData instance) =>
    <String, dynamic>{
      'children': instance.children?.map((e) => e?.toJson())?.toList(),
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
      'expanded': instance.expanded,
    };

ChildrenData _$ChildrenDataFromJson(Map<String, dynamic> json) {
  return ChildrenData(
    children: json['children'] as List,
    courseId: json['courseId'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    order: json['order'] as int,
    parentChapterId: json['parentChapterId'] as int,
    userControlSetTop: json['userControlSetTop'] as bool,
    visible: json['visible'] as int,
  );
}

Map<String, dynamic> _$ChildrenDataToJson(ChildrenData instance) =>
    <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
