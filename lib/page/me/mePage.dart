import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Me',
        style: TextStyle(color: Colors.red, fontSize: 20),
      ),
    );
  }
}
