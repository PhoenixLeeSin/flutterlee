import 'package:flutter/material.dart';
import '../widget/navigation_bar.dart';
import '../dao/weather_dao.dart';
import '../models/city_model.dart';
import 'dart:ui';
import '../weather/weatherReport.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPagePageState createState() => _WeatherPagePageState();
}

const historyArray = [
  '北京',
  '上海',
  '深圳',
  '惠州',
];

const hotCityArray = [
  '北京',
  '上海',
  '深圳',
  '惠州',
  '青岛',
  '杭州',
];

class _WeatherPagePageState extends State<WeatherPage> {
  CityModel model;
  List<String> cityList = [];
  TextEditingController _textEditingController = TextEditingController();
  bool _offstage = true;
  FocusNode _focusNode;
  String queryKeyword; //搜索关键词

  @override
  void initState() {
    _focusNode = FocusNode();
    _getCityModel();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  ///获取城市列表信息
  void _getCityModel() {
    WeatherDao().fetchCity().then((el) {
      if (mounted) {
        setState(() {
          model = el;
          for (var i = 0; i < model.city.length; i++) {
            cityList.addAll(model.city[i].lists);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          //全局点击空白处隐藏键盘
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus.unfocus();
            setState(() {
              _offstage = true;
            });
          }
        },
        child: Container(
          // decoration: BoxDecoration(color: Colors.red),
          child: Column(
            children: <Widget>[
              _createNavigationBar(),
              _createTextInput(),
              _createHistoryAndHotCityUI(),
            ],
          ),
        ),
      ),
    );
  }

  ///创建顶部导航栏
  Widget _createNavigationBar() {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xff56A151),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0),
              blurRadius: 1,
              spreadRadius: 2,
            ),
          ],
        ),
        child: SafeArea(
          child: NavigationBar(
            backgroundColor: Color(0xff56A151),
            leftIcon: Icons.arrow_back_ios,
            leftCallback: () {},
            title: '天气查询',
            rightCallback: () {},
            rightIcon: Icons.search,
          ),
        ));
  }

  ///创建搜索输入框
  Widget _createTextInput() {
    return Container(
      height: 60,
      padding: EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '请输入查询城市',
            prefixIcon: Icon(Icons.search)),
        controller: _textEditingController,
        focusNode: _focusNode,
        onChanged: (value) {
          //监听输入值
          print(value);
          _queryKeyword(value);
        },
        onTap: () {
          //键盘聚焦
          _focusNode.requestFocus();
          setState(() {
            _offstage = false;
          });
        },
        onEditingComplete: () {
          _focusNode.unfocus();
          setState(() {
            _offstage = true;
          });
        },
      ),
    );
  }

  ///创建城市选择相关相关UI
  Widget _createHistoryAndHotCityUI() {
    return Expanded(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              //历史记录
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    '历史记录',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    String city = historyArray[index];
                    return _createGridItem(city);
                  }, childCount: historyArray.length),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 3),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Divider(),
                ),
              ),
              //热门城市
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    '热门城市',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    String city = hotCityArray[index];
                    return _createGridItem(city);
                  }, childCount: hotCityArray.length),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 3,
                  ),
                ),
              ),
            ],
          ),

          ///
          Offstage(
            offstage: _offstage,
            child: _createCityList(context),
          )
        ],
      ),
    );
  }

  ///创建网格视图的单个item
  Widget _createGridItem(String city) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WeatherReportPage(
                      city: city,
                    )));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 4, 10, 4),
        alignment: Alignment.center,
        // padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Text(
          city,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  ///创建显示/隐藏的城市列表接口
  Widget _createCityList(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        kBottomNavigationBarHeight;

    if (cityList.length <= 0) return Container();

    return Container(
      decoration: BoxDecoration(color: Colors.white),
      height: availableHeight,
      child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            itemCount: cityList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  //进入天气预报界面
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeatherReportPage(
                                city: cityList[index],
                              )));
                },
                child: Container(
                  height: 55,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.grey[200], width: 1))),
                  child: Text(
                    cityList[index],
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 15,
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }

  ///搜索关键词
  void _queryKeyword(String keyword) {
    cityList.clear();
    for (var i = 0; i < model.city.length; i++) {
      cityList.addAll(model.city[i].lists);
    }
    if (keyword == '' || keyword == null) {
      setState(() {});
    } else {
      setState(() {
        _offstage = false;
        print('where');
        Iterable<String> a = cityList.where((element) {
          return element.contains(keyword);
        });

        ///防止空列表 历史记录和热门城市UI露出
        cityList = a.isEmpty ? cityList : a.toList();
      });
    }
  }
}
