import 'package:json_annotation/json_annotation.dart';
part 'home_model.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeModel {
  HomeModelData data;
  int code;
  int message;
  HomeModel({this.data, this.code, this.message});

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HomeModelData {
  int curPage;
  List<DatasData> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  HomeModelData({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  factory HomeModelData.fromJson(Map<String, dynamic> json) =>
      _$HomeModelDataFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DatasData {
  String apkLink;
  int audit;
  String author;
  bool canEdit;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String descMd;
  String envelopePic;
  bool fresh;
  String host;
  int id;
  String link;
  String niceDate;
  String niceShareDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int realSuperChapterId;
  int selfVisible;
  int shareDate;
  String shareUser;
  int superChapterId;
  String superChapterName;
  List<dynamic> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  DatasData({
    this.apkLink,
    this.audit,
    this.author,
    this.canEdit,
    this.chapterId,
    this.chapterName,
    this.collect,
    this.courseId,
    this.desc,
    this.descMd,
    this.envelopePic,
    this.fresh,
    this.host,
    this.id,
    this.link,
    this.niceDate,
    this.niceShareDate,
    this.origin,
    this.prefix,
    this.projectLink,
    this.publishTime,
    this.realSuperChapterId,
    this.selfVisible,
    this.shareDate,
    this.shareUser,
    this.superChapterId,
    this.superChapterName,
    this.tags,
    this.title,
    this.type,
    this.userId,
    this.visible,
    this.zan,
  });

  factory DatasData.fromJson(Map<String, dynamic> json) =>
      _$DatasDataFromJson(json);
  Map<String, dynamic> toJson() => _$DatasDataToJson(this);
}
