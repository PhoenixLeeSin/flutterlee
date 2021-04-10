import 'package:json_annotation/json_annotation.dart';
part 'weather_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherModel {
  int error_code;
  String reason;
  ResultData result;

  WeatherModel({
    this.error_code,
    this.reason,
    this.result,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultData {
  String city;
  List<FutureData> future;
  RealtimeData realtime;

  ResultData({
    this.city,
    this.future,
    this.realtime,
  });

  factory ResultData.fromJson(Map<String, dynamic> json) =>
      _$ResultDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResultDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RealtimeData {
  String aqi;
  String direct;
  String humidity;
  String info;
  String power;
  String temperature;
  String wid;

  RealtimeData({
    this.aqi,
    this.direct,
    this.humidity,
    this.info,
    this.power,
    this.temperature,
    this.wid,
  });

  factory RealtimeData.fromJson(Map<String, dynamic> json) =>
      _$RealtimeDataFromJson(json);
  Map<String, dynamic> toJson() => _$RealtimeDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FutureData {
  String date;
  String direct;
  String temperature;
  String weather;
  WidData wid;

  FutureData({
    this.date,
    this.direct,
    this.temperature,
    this.weather,
    this.wid,
  });

  factory FutureData.fromJson(Map<String, dynamic> json) =>
      _$FutureDataFromJson(json);
  Map<String, dynamic> toJson() => _$FutureDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WidData {
  String day;
  String night;

  WidData({
    this.day,
    this.night,
  });

  factory WidData.fromJson(Map<String, dynamic> json) =>
      _$WidDataFromJson(json);
  Map<String, dynamic> toJson() => _$WidDataToJson(this);
}
