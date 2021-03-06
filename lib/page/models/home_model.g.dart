// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return HomeModel(
    data: json['data'] == null
        ? null
        : HomeModelData.fromJson(json['data'] as Map<String, dynamic>),
    code: json['code'] as int,
    message: json['message'] as int,
  );
}

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'data': instance.data?.toJson(),
      'code': instance.code,
      'message': instance.message,
    };

HomeModelData _$HomeModelDataFromJson(Map<String, dynamic> json) {
  return HomeModelData(
    curPage: json['curPage'] as int,
    datas: (json['datas'] as List)
        ?.map((e) =>
            e == null ? null : DatasData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    offset: json['offset'] as int,
    over: json['over'] as bool,
    pageCount: json['pageCount'] as int,
    size: json['size'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$HomeModelDataToJson(HomeModelData instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas?.map((e) => e?.toJson())?.toList(),
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };

DatasData _$DatasDataFromJson(Map<String, dynamic> json) {
  return DatasData(
    apkLink: json['apkLink'] as String,
    audit: json['audit'] as int,
    author: json['author'] as String,
    canEdit: json['canEdit'] as bool,
    chapterId: json['chapterId'] as int,
    chapterName: json['chapterName'] as String,
    collect: json['collect'] as bool,
    courseId: json['courseId'] as int,
    desc: json['desc'] as String,
    descMd: json['descMd'] as String,
    envelopePic: json['envelopePic'] as String,
    fresh: json['fresh'] as bool,
    host: json['host'] as String,
    id: json['id'] as int,
    link: json['link'] as String,
    niceDate: json['niceDate'] as String,
    niceShareDate: json['niceShareDate'] as String,
    origin: json['origin'] as String,
    prefix: json['prefix'] as String,
    projectLink: json['projectLink'] as String,
    publishTime: json['publishTime'] as int,
    realSuperChapterId: json['realSuperChapterId'] as int,
    selfVisible: json['selfVisible'] as int,
    shareDate: json['shareDate'] as int,
    shareUser: json['shareUser'] as String,
    superChapterId: json['superChapterId'] as int,
    superChapterName: json['superChapterName'] as String,
    tags: json['tags'] as List,
    title: json['title'] as String,
    type: json['type'] as int,
    userId: json['userId'] as int,
    visible: json['visible'] as int,
    zan: json['zan'] as int,
  );
}

Map<String, dynamic> _$DatasDataToJson(DatasData instance) => <String, dynamic>{
      'apkLink': instance.apkLink,
      'audit': instance.audit,
      'author': instance.author,
      'canEdit': instance.canEdit,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'collect': instance.collect,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'descMd': instance.descMd,
      'envelopePic': instance.envelopePic,
      'fresh': instance.fresh,
      'host': instance.host,
      'id': instance.id,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'niceShareDate': instance.niceShareDate,
      'origin': instance.origin,
      'prefix': instance.prefix,
      'projectLink': instance.projectLink,
      'publishTime': instance.publishTime,
      'realSuperChapterId': instance.realSuperChapterId,
      'selfVisible': instance.selfVisible,
      'shareDate': instance.shareDate,
      'shareUser': instance.shareUser,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'tags': instance.tags,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan,
    };
