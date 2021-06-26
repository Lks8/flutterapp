import 'package:flutter/material.dart';
import 'chosen.dart';
import 'city.dart';
import 'custom.dart';

class CityItem extends StatelessWidget {
  final City city;
  final Function add;
  final Function delete;
  CityItem({this.city, this.add, this.delete});

  get child => null;

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chosen()),
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
                Text(
                  city.temperature.toString() + "°C",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  city.minTemperature.toString() +
                      " a " +
                      city.maxTemperature.toString() +
                      "°C",
                  style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ],

        ),
      ),
    );
  }
}
