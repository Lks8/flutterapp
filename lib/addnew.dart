import 'package:flutter/material.dart';
import 'main.dart';

class AddNew extends StatelessWidget {
  final String textInput;

  AddNew({this.textInput});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: FittedBox(
              fit: BoxFit.fitWidth, child: Text('Adicione uma localização')),
          backgroundColor: Color.fromRGBO(31, 121, 214, 1),
        ),
      body: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Pesquise uma cidade'
        ),
      ),
    );
  }
}