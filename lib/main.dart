import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tempo_clima/screens/addnew.dart';
import 'package:tempo_clima/screens/chosen.dart';
import 'package:tempo_clima/screens/widget/cityItem.dart';
import 'package:uuid/uuid.dart';

import 'models/city.dart';
import 'screens/custom.dart';

void main() {
  runApp(MaterialApp(
    home: SelectCity(),
    onGenerateRoute: (RouteSettings settings) {
      var routes = <String, WidgetBuilder>{
        // "/piru": (ctx) => Hello(settings.arguments),
        // "other": (ctx) => SomeWidget(),
        '/home': (context) => SelectCity(),
        '/chosen': (context) => Chosen(city: settings.arguments),
        '/add': (context) => AddNew(),
        '/custom': (context) => Custom(cities: settings.arguments),
      };
      WidgetBuilder builder = routes[settings.name];
      return MaterialPageRoute(builder: (ctx) => builder(ctx));
    },
  ));
}

class SelectCity extends StatefulWidget {
  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<SelectCity> {
  List<City> cities = [
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
                  onPressed: () async {
                    var ret = await Navigator.pushNamed(
                        context, "/custom",
                        arguments: cities
                    );
                    setState(() {
                      cities = ret;
                    });
                  })),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: IconButton(
                icon: const Icon(Icons.add),
                color: Colors.white,
                onPressed: () async {
                  var retorno = await Navigator.pushNamed(
                      context, "/add"
                  );
                  City newCity = new City(
                      customName: retorno,
                      name: retorno,
                      temperature: 0,
                      minTemperature: 0,
                      maxTemperature: 0,
                      pressure: 0,
                      humidity: 0);
                  cities.add(newCity);
                }),
          )
        ],
      ),
      body: new Card(
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
