import 'package:flutter/material.dart';
import 'package:fluttertestapp/settings/settingPage.dart';

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
          child: Text("MyDecreto",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24
            ),
          ),
        ),
        ListTile(
          title: Text("Impostazioni"),
          leading: Icon(Icons.settings),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
          },
        ),
        ListTile(
          title: Text("Informazioni"),
          leading: Icon(Icons.info),
          onTap: () {
            Navigator.pop(context);

          },
        )
      ],
    );
  }
}