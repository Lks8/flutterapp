import 'package:flutter/material.dart';
import 'package:tempo_clima/cityItem.dart';

import 'chosen.dart';
import 'addnew.dart';
import 'city.dart';
import 'custom.dart';

void main() {
  runApp(MaterialApp(
    home: SelectCity(),
  ));
}

class SelectCity extends StatefulWidget {
  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<SelectCity> {
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
      appBar: AppBar(
        title: FittedBox(
            fit: BoxFit.fitWidth, child: Text('Selecione uma localização')),
        backgroundColor: Color.fromRGBO(31, 121, 214, 1),
        actions: [
          Padding(
              padding: const EdgeInsets.all(1.0),
              child: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Custom()),
                    );
                  })),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: IconButton(
                icon: const Icon(Icons.add),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddNew()),
                  );
                }),
          )
        ],
      ),
      body: new Card(
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => Chosen()),
            // );
          child: Column(
            children: cities
                .map((city) => CityItem(
                    city: city,
                    add: () {
                      setState(() {
                        cities.add(city);
                      });
                    }))
                .toList(),
          ),
        ),
    );
  }
}
