import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tempo_clima/repositories/cityRepository.dart';
import '../chosen.dart';
import '../../models/city.dart';

class CityItemCustom extends StatelessWidget {
  final City city;
  final List<City> cities;
  final Function add;
  final Function delete;
  CityItemCustom({this.city, this.cities, this.add, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                print(city.customName);
                Navigator.pushNamed(
                  context,
                  '/chosen',
                  arguments: city,
                );
              },
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city.customName,
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    city.name,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            new Column(
              children: [
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    cities.remove(1);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
