import 'package:flutter/material.dart';
import '../home/homePage.dart';
import '../news/newsPage.dart';
import '../weather/weatherPage.dart';
import '../me/mePage.dart';

///根视图

const titles = ['首页', '新闻', '天气', '我的'];
const icons = [
  Icon(
    Icons.home,
    size: 22,
  ),
  Icon(
    Icons.new_releases,
    size: 22,
  ),
  Icon(
    Icons.cloud,
    size: 22,
  ),
  Icon(
    Icons.settings,
    size: 22,
  )
];

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with AutomaticKeepAliveClientMixin {
  int currentIndex = 0;
  PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('BottomBar'),
      // ),
      body: PageView(
        controller: _controller,
        children: [
          HomePage(),
          NewsPage(),
          WeatherPage(),
          MePage(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getItems(),
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(fontSize: 12.0),
        unselectedFontSize: 12.0,
        elevation: 2.0,
        type: BottomNavigationBarType.fixed, //这个必须设置 如果不设置 未选中的item不显示文字
        onTap: (index) {
          //页面跳转
          _controller.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.easeIn);

          setState(() {
            currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 22,
        ),
        backgroundColor: Colors.green,
        onPressed: () async {
          ///弹出对话框 并等待关闭
          bool delete = await showDeleteConfigDiglog1();
          if (delete) {
            print('已删除');
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  ///获取BottomNavigationBarItem数组
  List<BottomNavigationBarItem> _getItems() {
    List<BottomNavigationBarItem> list = [];
    for (var i = 0; i < titles.length; i++) {
      BottomNavigationBarItem item =
          BottomNavigationBarItem(icon: icons[i], label: titles[i]);
      list.add(item);
    }
    return list;
  }

  ///模拟弹出对话框
  Future<bool> showDeleteConfigDiglog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            '这是title',
            style: TextStyle(color: Colors.green, fontSize: 12),
          ),
          content: Text(
            '这是content',
            style: TextStyle(color: Colors.green, fontSize: 12),
          ),
          actions: <Widget>[
            MaterialButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                })
          ],
        );
      },
    );
  }
}
