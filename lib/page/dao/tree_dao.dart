import 'package:dio/dio.dart';

import '../utils/network/httputil.dart';
import 'dart:convert';
import '../models/tree_model.dart';

const url = 'https://www.wanandroid.com/tree/json';

class TreeDao {
  Future<TreeModel> fetch() async {
    TreeModel model;
    Response response = await HttpUtil().get(url);
    Map map = json.decode(response.data.toString());
    model = TreeModel.fromJson(map);
    return model;
  }
}
