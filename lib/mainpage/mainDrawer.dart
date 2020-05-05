import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class MainPageDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
              color: mainSwatch
          ),
          child: Text("KEBAB",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24
            ),
          ),
        ),
        ListTile(
          title: Text("Impostazioni"),
          leading: Icon(Icons.settings),
        ),
        ListTile(
          title: Text("NIGERUNDAYO"),
          leading: Icon(Icons.exit_to_app),
        )
      ],
    );
  }
}