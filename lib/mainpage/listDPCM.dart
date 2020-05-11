import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global.dart';

class ListDPCM extends StatefulWidget{
  ListDCPMState state;

  @override
  State<StatefulWidget> createState() {
    state = ListDCPMState();
    return state;
  }

}

class ListDCPMState extends State<ListDPCM>{
  List<dynamic> dpcmList = [];
  SharedPreferences preferences;

  @override
  void initState() {
    super.initState();

    //initializing preferences
    SharedPreferences.getInstance().then(
            (prefs){
              setState(() {
                this.preferences = prefs;
              });
            }
    );

    //starting asynchronous function to load DPCMs
    loadDPCMs();

  }

  @override
  Widget build(BuildContext context) {
    log("BUILDING UI!!!");

    //creating an empty listView that will be populated with DPCMs later
    return Scrollbar(
      child: ListView.separated(
          itemCount: dpcmList.length,
          itemBuilder: buildWidgetFromDPCM,
        separatorBuilder: (context, index) =>  Divider(),
      ),
    );
  }

  Future<void> loadDPCMs() async {
    log("GETTING DPCM!!!");
    List<dynamic> downloadedDPCM = [];
    //ADDING NULL DPCM
    log("DOWNLOADING NULL DPCM");
    String response = (await http.get('https://federicocapece.dev/api/dpcm')).body;
    Iterable dpcmIterable = json.decode(response);
    dpcmIterable.forEach((dpcm) => downloadedDPCM.add(dpcm));

    for(int i = 0; i<regionKeys.length; i++){
      if(preferences.getBool(regionKeys[i]) != true) continue;

      log("DOWNLOADING "+regionKeys[i]+" DPCM");
      String response = (await http.get('https://federicocapece.dev/api/dpcm/'+regionKeys[i])).body;
      Iterable dpcmIterable = json.decode(response);
      dpcmIterable.forEach((dpcm) => downloadedDPCM.add(dpcm));
    }


    setState(() {
      dpcmList.clear();
      dpcmList.addAll(downloadedDPCM);
    });
  }

  //this function build a ListTile from the index of a dpcm
  Widget buildWidgetFromDPCM(BuildContext context, int index){
    //log("BUILDING: " + dpcmList[index].toString());
    return ListTile(
      title: Text(dpcmList[index]['title']),
      subtitle: Text(dpcmList[index]['description']),
    );
  }

}