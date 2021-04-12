import 'package:flutter/material.dart';
import '../dao/nav_dao.dart';
import '../models/nav_model.dart';
import '../widget/navigation_bar.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  NavModel model;
  int selectedIndex = 0; //默认选中的index

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    await NavDao().fetch().then((value) {
      setState(() {
        model = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[_getNavigationBarUI(), _getMainUI(context)],
        ),
      ),
    );
  }

  ///导航栏UI
  Widget _getNavigationBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff56A151),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 0),
            spreadRadius: 2,
            blurRadius: 1,
          )
        ],
      ),
      child: SafeArea(
        child: NavigationBar(
          backgroundColor: Color(0xff56A151),
          leftIcon: Icons.menu,
          leftCallback: () {
            print("左按钮点击");
          },
          title: '导航',
          rightIcon: Icons.search,
          rightCallback: () {
            print('右按钮点击');
          },
        ),
      ),
    );
  }

  ///主UI
  Widget _getMainUI(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          model != null
              ? Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(top: 2),
                    child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return _getLeftItem(context, index);
                          },
                          itemCount: model.data.length,
                        )),
                  ),
                )
              : Container(),
          model != null
              ? Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 20,
                      children: _getRightItem(context),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  ///left Item
  Widget _getLeftItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.grey[100] : Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Offstage(
              offstage: selectedIndex == index ? false : true,
              child: Container(
                width: 5,
                height: 50,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10),
              child: Text(
                model.data[index].name,
                style: TextStyle(
                  color: selectedIndex == index
                      ? Theme.of(context).primaryColor
                      : Colors.black54,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ///right Item
  List<Widget> _getRightItem(BuildContext context) {
    return model.data[selectedIndex].articles.map((el) {
      return GestureDetector(
        onTap: () {},
        child: PhysicalModel(
          color: Colors.grey[200],
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(20),
          elevation: 3,
          shadowColor: Colors.grey[400],
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Text(
              el.title,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}
