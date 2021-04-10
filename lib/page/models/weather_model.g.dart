// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return WeatherModel(
    error_code: json['error_code'] as int,
    reason: json['reason'] as String,
    result: json['result'] == null
        ? null
        : ResultData.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'error_code': instance.error_code,
      'reason': instance.reason,
      'result': instance.result?.toJson(),
    };

ResultData _$ResultDataFromJson(Map<String, dynamic> json) {
  return ResultData(
    city: json['city'] as String,
    future: (json['future'] as List)
        ?.map((e) =>
            e == null ? null : FutureData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    realtime: json['realtime'] == null
        ? null
        : RealtimeData.fromJson(json['realtime'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResultDataToJson(ResultData instance) =>
    <String, dynamic>{
      'city': instance.city,
      'future': instance.future?.map((e) => e?.toJson())?.toList(),
      'realtime': instance.realtime?.toJson(),
    };

RealtimeData _$RealtimeDataFromJson(Map<String, dynamic> json) {
  return RealtimeData(
    aqi: json['aqi'] as String,
    direct: json['direct'] as String,
    humidity: json['humidity'] as String,
    info: json['info'] as String,
    power: json['power'] as String,
    temperature: json['temperature'] as String,
    wid: json['wid'] as String,
  );
}

Map<String, dynamic> _$RealtimeDataToJson(RealtimeData instance) =>
    <String, dynamic>{
      'aqi': instance.aqi,
      'direct': instance.direct,
      'humidity': instance.humidity,
      'info': instance.info,
      'power': instance.power,
      'temperature': instance.temperature,
      'wid': instance.wid,
    };

FutureData _$FutureDataFromJson(Map<String, dynamic> json) {
  return FutureData(
    date: json['date'] as String,
    direct: json['direct'] as String,
    temperature: json['temperature'] as String,
    weather: json['weather'] as String,
    wid: json['wid'] == null
        ? null
        : WidData.fromJson(json['wid'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FutureDataToJson(FutureData instance) =>
    <String, dynamic>{
      'date': instance.date,
      'direct': instance.direct,
      'temperature': instance.temperature,
      'weather': instance.weather,
      'wid': instance.wid?.toJson(),
    };

WidData _$WidDataFromJson(Map<String, dynamic> json) {
  return WidData(
    day: json['day'] as String,
    night: json['night'] as String,
  );
}

Map<String, dynamic> _$WidDataToJson(WidData instance) => <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
    };
