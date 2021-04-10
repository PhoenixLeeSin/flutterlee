// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) {
  return BannerModel(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : BannerModelData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    code: json['code'] as int,
    message: json['message'] as int,
  );
}

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'code': instance.code,
      'message': instance.message,
    };

BannerModelData _$BannerModelDataFromJson(Map<String, dynamic> json) {
  return BannerModelData(
    desc: json['desc'] as String,
    id: json['id'] as int,
    imagePath: json['imagePath'] as String,
    isVisible: json['isVisible'] as int,
    order: json['order'] as int,
    title: json['title'] as String,
    type: json['type'] as int,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$BannerModelDataToJson(BannerModelData instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
