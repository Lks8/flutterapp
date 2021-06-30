import 'package:hive/hive.dart';

part 'city.g.dart';

@HiveType(typeId: 1)
class City{
  @HiveField(0)
  String customName;
  @HiveField(1)
  String name;
  @HiveField(2)
  int temperature;
  @HiveField(3)
  int minTemperature;
  @HiveField(4)
  int maxTemperature;
  @HiveField(5)
  int pressure;
  @HiveField(6)
  int humidity;
  @HiveField(7)
  int timezone;
  @HiveField(8)
  String weather;

  City({
    this.customName,
    this.name,
    this.temperature,
    this.minTemperature,
    this.maxTemperature,
    this.pressure,
    this.humidity,
    this.timezone,
    this.weather,
  });
  City.fromJson(Map<dynamic, dynamic> json, String custom) {
      name = json['name'];
      customName = custom;
      temperature = json['main']['temp'].toInt();
      minTemperature = json['main']['temp_min'].toInt();
      maxTemperature = json['main']['temp_max'].toInt();
      pressure = json['main']['pressure'].toInt();
      humidity = json['main']['humidity'].toInt();
      timezone = json['timezone'].toInt();
      weather = json['weather'][0]['main'];
      print(weather);
  }
}