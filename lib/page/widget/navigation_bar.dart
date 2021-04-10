import 'package:flutter/material.dart';

///顶部导航栏组件信息封装  包括左：按钮  中间文字 右按钮

class NavigationBar extends StatefulWidget {
  final Color backgroundColor;
  final IconData leftIcon;
  final Function() leftCallback;
  final IconData rightIcon;
  final Function() rightCallback;
  final String title;
  const NavigationBar(
      {Key key,
      this.backgroundColor,
      this.leftIcon,
      this.leftCallback,
      this.rightIcon,
      this.rightCallback,
      this.title})
      : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      // decoration: BoxDecoration(
      //   boxShadow: [
      //     //阴影效果
      //     BoxShadow(
      //       offset: Offset(2, 2), //阴影在X轴和Y轴上的偏移
      //       color: widget.backgroundColor, //阴影颜色
      //       blurRadius: 0.2, //阴影程度
      //       spreadRadius: 1, //阴影扩散的程度 取值可以正数,也可以是负数
      //     ),
      //   ],
      //   borderRadius: BorderRadius.circular(12.0),
      //   color: Colors.white,
      // ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (widget.leftCallback != null) {
                widget.leftCallback();
              }
            },
            child: Icon(
              widget.leftIcon,
              size: 24,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          )),
          GestureDetector(
            onTap: () {
              if (widget.rightCallback != null) {
                widget.rightCallback();
              }
            },
            child: Icon(
              widget.rightIcon,
              size: 24,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
