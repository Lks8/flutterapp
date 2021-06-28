import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tempo_clima/models/city.dart';
import 'package:intl/intl.dart';
import 'package:tempo_clima/repositories/cityRepository.dart';
import '../main.dart';

class Chosen extends StatefulWidget {
  final City city;
  const Chosen({this.city});

  @override
  _ChosenState createState() => _ChosenState();
}

class _ChosenState extends State<Chosen> {
  City city;
  CityRepository cityRepository = new CityRepository();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    city = widget.city;
    cityRepository.fetchCityWeather(city.name).then((value) {
      setState((){
        city = City.fromJson(jsonDecode(value), city.customName);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('HH:mm').format(now);

        // ModalRoute
        // .of(context)
        // .settings
        // .arguments;
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 121, 214, 1),
      body: Padding(
        padding: MediaQuery
            .of(context)
            .padding,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(4, 51, 118, 1),
                        border: Border(
                          top: BorderSide(width: 0.5, color: Colors.white),
                          left: BorderSide(width: 0.5, color: Colors.white),
                          right: BorderSide(width: 0.5, color: Colors.white),
                          bottom: BorderSide(width: 0.5, color: Colors.white),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                        )),
                    height: 140,
                    width: 278,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            child: Text(
                              city.customName,
                              style:
                              TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                          FittedBox(
                            child: Text(
                              city.name,
                              style:
                              TextStyle(color: Colors.grey, fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 3, color: Color.fromRGBO(0, 73, 177, 1)),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_rounded),
                      color: Colors.white,
                      iconSize: 35,
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => SelectCity()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cloud_queue,
                        color: Colors.white,
                        size: 180,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${city.temperature}°C",
                          style: TextStyle(color: Colors.white, fontSize: 60),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          formattedDate,
                          style: TextStyle(color: Colors.white, fontSize: 60),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 50),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FittedBox(
                          child: Text(
                            "Min: ${city.minTemperature}°C",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            "Máx: ${city.maxTemperature}°C",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 166, 255, 1),
                        border: Border(
                          top: BorderSide(width: 0.5, color: Colors.white),
                          left: BorderSide(width: 0.5, color: Colors.white),
                          right: BorderSide(width: 0.5, color: Colors.white),
                          bottom: BorderSide(width: 0.5, color: Colors.white),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                        )),
                    height: 210,
                    width: 340,

                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Text(
                                "Outros dados:",
                                style:
                                TextStyle(color: Colors.white,
                                    fontSize: 38,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    child: Text(
                                      "Pressão: ${city.pressure} hPa",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  FittedBox(
                                    child: Text(
                                      "Umidade: ${city.humidity}%",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
