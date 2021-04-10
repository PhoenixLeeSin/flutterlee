import '../../page/utils/network/httputil.dart';
import '../models/nav_model.dart';
import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';

const url = 'https://www.wanandroid.com/navi/json';

class NavDao {
  Future<NavModel> fetch() async {
    NavModel model;
    Response response = await HttpUtil().get(url);
    Map map = jsonDecode(response.data.toString());
    model = NavModel.fromJson(map);
    return model;
  }
}
