import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'page/tabnav/tabnavigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark);

    SystemChrome.setSystemUIOverlayStyle(style);

    return MaterialApp(
      home: TabNavigator(),
      title: 'LeeSin',
      theme: ThemeData(primaryColor: Colors.blue, fontFamily: 'PingFang'),
    );
  }
}
