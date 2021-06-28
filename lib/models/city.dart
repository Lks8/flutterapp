import 'package:uuid/uuid.dart';

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
}