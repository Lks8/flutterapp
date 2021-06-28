import 'package:flutter/material.dart';
import 'package:tempo_clima/models/city.dart';
import 'package:tempo_clima/screens/widget/cityItemCustom.dart';
import 'package:tempo_clima/main.dart';

class Custom extends StatefulWidget {
  final List<City> cities;
  const Custom({this.cities});
  @override
  _Custom createState() => _Custom();
}

class _Custom extends State<Custom> {
  List<City> cities = [];

  @override
  Widget build(BuildContext context) {
    cities = widget.cities;
    return WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_rounded),
            onPressed: () => Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => SelectCity()),
            )
          ),
          title: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text('Personalize suas localizações')),
          backgroundColor: Color.fromRGBO(31, 121, 214, 1),
          actions: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: IconButton(
                icon: const Icon(Icons.check),
                color: Colors.white,
                onPressed: () {
                  Map<dynamic, dynamic> parameters = {

                  };
                  Navigator.pop(context, parameters);
                },
              ),
            ),
          ],
        ),
        body: new Card(
          child: Column(
            children: cities
                .map((city) => CityItemCustom(
                    city: city,
                    add: () {
                      setState(() {
                        cities.add(city);
                      });
                    }))
                .toList(),
          ),
        ),
      ),
    );
  }
}
