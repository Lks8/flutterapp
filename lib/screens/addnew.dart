import 'dart:convert';
import 'package:flutter/material.dart';
import '../main.dart';

class AddNew extends StatefulWidget {

  @override
  AddNewState createState() {
    return new AddNewState();
  }
}

class AddNewState extends State<AddNew> {
  final cityController = TextEditingController();
  bool _validatea = false;

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back_rounded),
              onPressed: () => Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => SelectCity()),
              )
          ),
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
                      errorText:
                          _validatea ? 'Preencha todos os campos!' : null),
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
                          if (cityController.text.isNotEmpty) {
                            String parameters = cityController.text;
                            Navigator.pop(context, parameters);
                          }
                          cityController.text.isEmpty
                              ? _validatea = true
                              : _validatea = false;
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
      ),
    );
  }
}
