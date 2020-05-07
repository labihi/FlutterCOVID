import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget{
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> regionList = [
    "Abruzzo",
    "Basilicata",
    "Calabria",
    "Campania",
    "Emilia-Romagna",
    "Friuli-Venezia Giulia",
    "Lazio",
    "Liguria",
    "Lombardia",
    "Marche",
    "Molise",
    "Piemonte",
    "Puglia",
    "Sardegna",
    "Sicilia",
    "Toscana",
    "Trentino-Alto Adige",
    "Umbria",
    "Valle d'Aosta",
    "Veneto"
  ];

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
            delegate: SliverChildListDelegate(generateRegionList()),
          ),
        ],
      ),
    );
  }

  //generate a List of region widget
  List<Widget> generateRegionList(){
    return new List<Widget>.generate(regionList.length, (index) => generateRegionTile(index));
  }

  //generate a single region switch from the region index
  Widget generateRegionTile(index) {
    return SwitchListTile(
      title: Text(regionList[index]),
      value: true,
      onChanged: (bool value) {
        setState(() async {
          //TODO: set a local state, on pop set all the local states to the SharedPreferences
        });
      },
    );
  }

}