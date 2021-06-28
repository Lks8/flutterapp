import 'dart:convert';

import 'package:flutter/material.dart';

class AddNew extends StatefulWidget {
  @override
  AddNewState createState() {
    return new AddNewState();
  }
}

class AddNewState extends State<AddNew> {
  final cityController = TextEditingController();
  final customNameController = TextEditingController();
  bool _validatea = false;
  bool _validateb = false;

  @override
  void dispose() {
    cityController.dispose();
    customNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
            fit: BoxFit.fitWidth, child: Text('Adicione uma localização')),
        backgroundColor: Color.fromRGBO(31, 121, 214, 1),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: TextField(
                controller: cityController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Informe o nome da cidade',
                    errorText: _validatea ? 'Preencha todos os campos!' : null),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: TextField(
                controller: customNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Coloque um nome personalizado',
                    errorText: _validateb ? 'Preencha todos os campos!' : null),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (cityController.text.isNotEmpty &&
                            customNameController.text.isNotEmpty) {
                          Map<dynamic, dynamic> parameters = {
                            "cityName": cityController.text,
                            "cityCustomName": customNameController.text
                          };
                          Navigator.pop(context, parameters);
                        }
                        cityController.text.isEmpty ? _validatea = true : _validatea = false;
                        customNameController.text.isEmpty ? _validateb = true : _validateb = false;
                      });
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Pronto!",
                            style: TextStyle(
                                fontSize: 25, color: Colors.white))))),
          ),
        ],
      ),
    );
  }
}
