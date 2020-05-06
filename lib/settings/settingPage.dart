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
      body: new CustomScrollView(
        slivers: [
          new SliverToBoxAdapter(
            child:  ListTile(
              leading: Icon(Icons.map),
              title: Text("Regioni"),
            ),

          ),
          new SliverList(
            delegate: new SliverChildListDelegate(
              new List<Widget>.generate(regionList.length, (int index) {
                return ListTile(
                  title: Text(regionList[index]),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget widgetBuilder(BuildContext context, int index){
      return ListTile (
        title: Text(regionList[index]),
      );
  }
}