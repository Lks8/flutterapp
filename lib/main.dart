import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tempo_clima/repositories/cityRepository.dart';
import 'package:tempo_clima/screens/addnew.dart';
import 'package:tempo_clima/screens/chosen.dart';
import 'package:tempo_clima/screens/widget/cityItem.dart';
import 'dart:async';
import 'models/city.dart';
import 'screens/custom.dart';

void main() async {
  // var path = Directory.current.path;
  // var dir = Directory(path);
  // await dir.create(recursive: true);
  // Hive..init(path)..registerAdapter(CityAdapter());
  var box = await Hive.openBox('SavedCities');
  List<City> cities = [];
  var cidades = box.get('Cidades');
  if(cidades==null) {
    box.put('Cidades', cities);
  }

  runApp(MaterialApp(
    home: SelectCity(),
    onGenerateRoute: (RouteSettings settings) {
      var routes = <String, WidgetBuilder>{
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
  List<City> cities;
  SelectCity({this.cities});
  @override
  _CityListState createState() => _CityListState();

}

class _CityListState extends State<SelectCity> {
  List<City> cities = [];
  CityRepository cityRepository = new CityRepository();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cities.forEach((city) {
      cityRepository.fetchCityWeather(city.name).then((value) {
        setState(() {
          city = City.fromJson(jsonDecode(value), city.customName);
        });
      });
    });
  }

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
                    var ret = await Navigator.pushNamed(context, "/custom",
                        arguments: cities);
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
                  var retorno = await Navigator.pushNamed(context, "/add");
                  if (retorno is String) {
                    cityRepository.fetchCityWeather(retorno).then((value) async {
                      City newCity = new City.fromJson(jsonDecode(value), retorno);
                      var box = await Hive.openBox('SavedCities');
                      List<City> savedCities = box.get("Cidades");
                      savedCities.add(newCity);
                      print(box.get('Cidades')); // Garantia de persistencia dos dados
                      setState(() {
                        cities.add(newCity);
                        super.didChangeDependencies();
                      });
                    });
                  }
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
