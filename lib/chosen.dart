import 'package:flutter/material.dart';
import 'package:tempo_clima/city.dart';

import 'cityItem.dart';
import 'main.dart';

class Chosen extends StatelessWidget {
  List<City> cities = [
    City(
        customName: "Cidade da mamãe",
        name: "São Paulo - Brasil",
        temperature: 28,
        minTemperature: 20,
        maxTemperature: 32),
    City(
        customName: "Meu Local",
        name: "Buenos Aires - Argentina",
        temperature: 15,
        minTemperature: 13,
        maxTemperature: 20)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 121, 214, 1),
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new Column(
              children: [
                Container(
                  child: Text(
                      "Casa da mamãe",
                      style: TextStyle(color: Colors.white))
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => SelectCity()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
