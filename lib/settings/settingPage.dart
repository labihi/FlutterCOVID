import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global.dart';

class SettingsPage extends StatefulWidget{
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SharedPreferences preferences;
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then(
            (prefs){
              setState(() {
                this.preferences = prefs;
              });
            }
    );

  }

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
    return new List<Widget>.generate(humanReadableRegions.length, (index) => generateRegionTile(index));
  }

  //generate a single region switch from the region index
  Widget generateRegionTile(index) {
    return SwitchListTile(
      title: Text(humanReadableRegions[regionKeys[index]]),
      value: preferences?.getBool(regionKeys[index]) ?? false,
      onChanged: (bool value) {
        setState(() {
          preferences.setBool(regionKeys[index], value);
        });
      },
    );
  }

}