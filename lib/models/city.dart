import 'package:uuid/uuid.dart';

class CityFields {
  static final String customName = 'customName';
  static final String name = 'name';
}

class City{
  String customName;
  String name;
  int temperature;
  int minTemperature;
  int maxTemperature;
  int pressure;
  int humidity;

  City({
    this.customName,
    this.name,
    this.temperature,
    this.minTemperature,
    this.maxTemperature,
    this.pressure,
    this.humidity,
  });
  City.fromJson(Map<dynamic, dynamic> json, String custom) {
      name = json['name'];
      customName = custom;
      temperature = json['main']['temp'].toInt();
      minTemperature = json['main']['temp_min'].toInt();
      maxTemperature = json['main']['temp_max'].toInt();
      pressure = json['main']['pressure'].toInt();
      humidity = json['main']['humidity'].toInt();
  }

  City copy({
    String customName,
    String name,
  }) =>
      City(
        customName: customName ?? this.customName,
        name: name ?? this.name,
      );

  static City deJson(Map<String, Object> json) => City(
    customName: json[CityFields.customName] as String,
    name: json[CityFields.name] as String,
  );

  Map<String, Object> toJson() => {
    CityFields.customName: customName,
    CityFields.name: name,
  };
}