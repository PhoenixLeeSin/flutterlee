import 'package:dio/dio.dart';
import '../models/weather_model.dart';
import 'dart:convert';
import '../utils/network/httputil.dart';
import '../models/city_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

const url = 'http://apis.juhe.cn/simpleWeather/query';
const key = '9c83d0b79e3ced94b3ccc6fa2763a9a5';

class WeatherDao {
  ///获取热门城市
  Future<CityModel> fetchCity() async {
    CityModel model;
    //读取json文件
    String jsonString =
        await rootBundle.loadString("lib/page/models/city.json");
    //转化为List或者map
    Map map = json.decode(jsonString);
    model = CityModel.fromJson(map);
    print(model);
    return model;
  }

  ///获取某一城市的天气情况
  Future<WeatherModel> fetchWeather(String city) async {
    var queryUrl = url + '?city=' + Uri.encodeComponent(city) + '&key=$key';
    WeatherModel model;
    Response response = await HttpUtil().get(queryUrl);
    Map map = json.decode(response.data.toString());
    model = WeatherModel.fromJson(map);
    return model;
  }
}
