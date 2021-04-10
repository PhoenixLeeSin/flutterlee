import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  CityModel({
    this.city,
  });

  List<City> city;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        city: List<City>.from(json["city"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "city": List<dynamic>.from(city.map((x) => x.toJson())),
      };
}

class City {
  City({
    this.lists,
    this.title,
  });

  List<String> lists;
  String title;

  factory City.fromJson(Map<String, dynamic> json) => City(
        lists: List<String>.from(json["lists"].map((x) => x)),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "lists": List<dynamic>.from(lists.map((x) => x)),
        "title": title,
      };
}
