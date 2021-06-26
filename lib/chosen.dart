import 'package:flutter/material.dart';
import 'package:tempo_clima/city.dart';

import 'cityItem.dart';
import 'main.dart';

class Chosen extends StatelessWidget {
  City city;

  @override
  Widget build(BuildContext context) {
    city = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 121, 214, 1),
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Row(
          children: [
            Padding(
            padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 100,
                width: 278,
                color: Color.fromRGBO(4, 51, 118, 1),
                child: Column(
                  children: [
                    Text("Casa da mamãe",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Text("São Paulo - Brasil",
                        style: TextStyle(color: Colors.grey, fontSize: 25)
                    ),
                  ],
                ),
              ),
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
      ),
    );
  }
}
