import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../dao/weather_dao.dart';
import 'package:intl/intl.dart';

class WeatherReportPage extends StatefulWidget {
  final String city;
  WeatherReportPage({Key key, this.city}) : super(key: key);

  @override
  _WeatherReportPageState createState() => _WeatherReportPageState();
}

class _WeatherReportPageState extends State<WeatherReportPage> {
  WeatherModel model;

  @override
  void initState() {
    _getWeatherInfo();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff87AEF8), Color(0xff576DF6)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: model != null
            ? Column(
                children: <Widget>[
                  _createCityInfoUI(),
                  _createWeatherImageUI(),
                  _createWeatherInfoUI(),
                  _createFutureWeather(context),
                ],
              )
            : Container(),
      ),
    );
  }

  ///城市信息UI
  Widget _createCityInfoUI() {
    return Container(
      // decoration: BoxDecoration(color: Colors.red),
      // height: 80,
      padding: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              model.result.city ?? '',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now()),
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  ///创建天气图片
  Widget _createWeatherImageUI() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'images/WeatherIcon - 1-12.png',
        width: 150,
        height: 150,
        fit: BoxFit.contain,
      ),
    );
  }

  ///创建天气其他信息UI
  Widget _createWeatherInfoUI() {
    return Container(
      padding: EdgeInsets.only(left: 80, right: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Text(
                  '温度',
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  model.result.realtime.temperature ?? '' + '℃',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                child: Text(
                  '湿度',
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  model.result.realtime.humidity ?? '' + '%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                child: Text(
                  '风力',
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: RichText(
                  text: TextSpan(
                      text: model.result.realtime.wid ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' km',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ))
                      ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///获取未来五天天气预报
  Widget _createFutureWeather(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 20 * 5) /
        model.result.future.length;
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: model.result.future.map((el) {
            return PhysicalModel(
                color: Color(0xff8EA3ED),
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  width: width,
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(
                        'images/WeatherIcon - 1-11.png',
                        height: 44,
                        width: 44,
                        fit: BoxFit.contain,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 4),
                        child: Text(
                          el.date.substring(6),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        el.temperature,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ));
          }).toList(),
        ),
      ),
    );
  }

  ///获取某一城市的天气信息以及预报情况
  void _getWeatherInfo() async {
    await WeatherDao().fetchWeather(widget.city).then((value) {
      setState(() {
        model = value;
      });
    });
  }
}
