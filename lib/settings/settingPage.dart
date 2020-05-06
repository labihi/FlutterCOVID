import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget{
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> regionList = ["Abruzzo", "Basilicata", "Calabria", "Campania", "Emilia-Romagna", "Friuli-Venezia Giulia", "Lazio", "Liguria", "Lombardia", "Marche", "Molise", "Piemonte", "Puglia", "Sardegna", "Sicilia", "Toscana", "Trentino-Alto Adige", "Umbria", "Valle d'Aosta", "Veneto"];

  @override
  Widget build(BuildContext context) {
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
            ListView.separated(
              itemCount: regionList.length,
              itemBuilder: widgetBuilder,
              separatorBuilder: (context, index) =>  Divider(),
            ),
          ]
      ),
    );
  }

  Widget widgetBuilder(BuildContext context, int index){
      return ListTile (
        title: Text('BESTIA'),
      );
  }
}