import 'dart:convert';

import 'package:dio/dio.dart';

import '../utils/network/httputil.dart';
import '../models/banner_model.dart';
import '../models/home_model.dart';

const url = 'https://www.wanandroid.com/banner/json';

const listUrl = 'https://www.wanandroid.com/article/list'; //后面拼接 'page' + /json

class HomeDao {
  //获取banner数据
  Future<BannerModel> fetchBanner() async {
    BannerModel model;
    Response response = await HttpUtil().get(url);
    Map map = jsonDecode(response.data.toString());
    model = BannerModel.fromJson(map);
    return model;
  }

  //获取首页列表文章数据
  Future<HomeModel> fetchHome(int page) async {
    HomeModel model;
    var url = listUrl + '/' + page.toString() + '/json';
    Response response = await HttpUtil().get(url);
    Map map = jsonDecode(response.data.toString());
    model = HomeModel.fromJson(map);
    return model;
  }
}
