import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../models/banner_model.dart';
import '../models/home_model.dart';
import '../dao/home_dao.dart';
import '../widget/navigation_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<BannerModelData> bannerModelList = [];
  List<DatasData> homeModelList = [];
  int page = 0;
  bool _loadMore = false;
  bool _loading = false;

  ScrollController _scrollController = ScrollController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    _getBannerData();
    _getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
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
                title: '首页title',
                rightIcon: Icons.search,
                rightCallback: () {
                  print('右按钮点击');
                },
              )),
            ),
            Container(
              height: 170,
              padding: EdgeInsets.all(5),
              child: _createSwiper(context),
            ),
            Expanded(
              flex: 1,
              child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: true,
                    controller: _refreshController,
                    onRefresh: () {
                      _getHomeData();
                    },
                    onLoading: () {
                      _getHomeData(loadMore: true);
                    },
                    child: ListView(
                      controller: _scrollController,
                      children: _createList(context),
                    ),
                    header: WaterDropHeader(),
                    footer: CustomFooter(builder: (context, mode) {
                      Widget body;
                      if (mode == LoadStatus.idle) {
                        body = Text("上拉加载");
                      } else if (mode == LoadStatus.loading) {
                        body = CupertinoActivityIndicator();
                      } else if (mode == LoadStatus.failed) {
                        body = Text("加载失败！");
                      } else if (mode == LoadStatus.canLoading) {
                        body = Text("松手，加载更多");
                      } else {
                        body = Text("没有更多数据了");
                      }
                      return Container(
                        height: 55.0,
                        child: Center(child: body),
                      );
                    }),
                  )),
            )
          ],
        ));
  }

  ///获取banner数据
  void _getBannerData() {
    HomeDao().fetchBanner().then((model) {
      setState(() {
        model.data.forEach((element) {
          bannerModelList.add(element);
        });
        print(bannerModelList);
        _loading = false;
      });
    });
  }

  ///获取首页文章数据
  void _getHomeData({loadMore = false}) {
    if (loadMore) {
      setState(() {
        _loadMore = true;
      });
      page++;
    } else {
      page = 1;
    }

    HomeDao().fetchHome(page).then((model) {
      setState(() {
        if (_loadMore) {
          model.data.datas.forEach((element) {
            homeModelList.add(element);
          });
        } else {
          homeModelList.clear();
          model.data.datas.forEach((element) {
            homeModelList.add(element);
          });
        }
        _loading = false;
        if (loadMore) {
          _refreshController.loadComplete();
        } else {
          _refreshController.refreshCompleted();
        }
      });
    });
  }

  @override
  bool get wantKeepAlive => true;

  ///创建轮播图组件
  Widget _createSwiper(BuildContext context) {
    return Swiper(
      itemCount: bannerModelList.length,
      autoplay: true,
      onTap: (index) {
        print("点击了第${index}个");
      },
      pagination: SwiperPagination(
        alignment: Alignment.bottomRight,
        margin: EdgeInsets.only(right: 20, bottom: 10),
        builder: SwiperPagination.dots,
      ),
      itemBuilder: (context, index) {
        return PhysicalModel(
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAlias, //必须设置此属性
            color: Colors.transparent,
            child: Image.network(
              bannerModelList[index].imagePath,
              fit: BoxFit.fill,
            ));
      },
    );
  }

  ///创建列表组件
  List<Widget> _createList(BuildContext context) {
    return homeModelList.map((model) {
      return Container(
        padding: EdgeInsets.fromLTRB(20, 0, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, right: 20),
              child: Icon(
                Icons.favorite_border,
                size: 24,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(2, 5, 5, 10),
                      child: Text(
                        model.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: Colors.black45),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green[900], width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            model.superChapterName,
                            style: TextStyle(
                                color: Colors.green[900], fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          model.author,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            )
          ],
        ),
      );
    }).toList();
  }
}
