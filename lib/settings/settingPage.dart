import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Impostazioni'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Regioni'),
            ),
          ]
        ),
      );
    },
  ));
}