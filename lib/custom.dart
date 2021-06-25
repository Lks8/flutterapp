import 'package:flutter/material.dart';
import 'package:tempo_clima/cityItem.dart';
import 'city.dart';

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
      body: Column(
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
    );
  }
}

class Custom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: FittedBox(
          fit: BoxFit.fitWidth, child: Text('Personalize suas localizações')),
      backgroundColor: Color.fromRGBO(31, 121, 214, 1),
      actions: [
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: IconButton(
            icon: const Icon(Icons.check),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => SelectCity()),
              );
            },
          ),
        ),
      ],
    ));
  }
}

class Buttons extends StatelessWidget {
  final Function check;
  final Function delete;
  Buttons(this.check, this.delete);
  @override
  Widget build(Object context) =>
      IconButton(icon: Icon(Icons.check), onPressed: check);
}

class SelectCity extends StatefulWidget {
  @override
  _CityListState createState() => _CityListState();
}

class _Rola extends State<SelectCity> {
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
            padding: const EdgeInsets.all(9.0),
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
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
    );
  }

// Widget buildTopBarIcons(){
//   return Positioned(
//     top: 0.0,
//     right: 0.0,
//     child: new IconButton(
//         icon: Icon(Icons.add),
//         onPressed: add,
//         color: Colors.black
//     ),
//   );
// }
}
