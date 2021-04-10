import 'package:flutter/material.dart';
import '../models/tree_model.dart';
import '../dao/tree_dao.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../widget/navigation_bar.dart';
import 'dart:math';
import '../widget/loading_container.dart';
import 'dart:async';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

const iconsArray = [
  Icons.ac_unit,
  Icons.airplay,
  Icons.access_time_sharp,
  Icons.warning_amber_sharp
];

class _NewsPageState extends State<NewsPage> {
  List<TreeModelData> list = [];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  bool _loading = true;
  Timer _timer;

  @override
  void initState() {
    _getTreeData();
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LoadingContainer(
        child: _createBodyView(),
        isLoading: _loading,
        cover: false,
      ),
    );
  }

  ///获取树形数据
  void _getTreeData() {
    TreeDao().fetch().then((model) {
      //模拟延迟2s后loading结束 出现数据界面
      Future.delayed(Duration(seconds: 2), () {
        if (!mounted) return;
        setState(() {
          list = model.data;
          _refreshController.refreshCompleted();
          _loading = false;
        });
      });
    });
  }

  ///生成随机数
  int _getRandom() {
    return Random().nextInt(4);
  }

  ///生成scrollView
  Widget _createSingleChildScrollView() {
    return SingleChildScrollView(
      child: Container(
        child: ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                list[panelIndex].expanded = (list[panelIndex].expanded == null
                    ? true
                    : !list[panelIndex].expanded);
              });
            },
            children: list.map((model) {
              return ExpansionPanel(
                  isExpanded: model.expanded ?? false,
                  headerBuilder: (BuildContext context, bool expanded) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          model.expanded =
                              model.expanded == null ? true : !model.expanded;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Icon(
                                iconsArray[_getRandom()],
                                size: 24,
                                color: Colors.grey,
                              ),
                            ),
                            Expanded(
                              // flex: 1,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                height: 40,
                                decoration:
                                    BoxDecoration(color: Colors.transparent),
                                child: Text(
                                  model.name,
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  body: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.builder(
                        itemCount: model.children.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Text(
                                    model.children[index].name,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                    color: Colors.grey[500],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )));
            }).toList()),
      ),
    );
  }

  ///生成页面的body
  Widget _createBodyView() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Color(0xff56A151), boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0),
              spreadRadius: 2,
              blurRadius: 1,
            )
          ]),
          child: SafeArea(
              child: NavigationBar(
            backgroundColor: Color(0xff56A151),
            leftIcon: Icons.menu,
            leftCallback: () {
              print("左按钮点击");
            },
            title: '树形',
            rightIcon: Icons.search,
            rightCallback: () {
              print('右按钮点击');
            },
          )),
        ),
        Expanded(
          flex: 1,
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            child: _createSingleChildScrollView(),
            onRefresh: () {
              _getTreeData();
            },
            header: WaterDropHeader(),
            controller: _refreshController,
          ),
        )
      ],
    );
  }
}
