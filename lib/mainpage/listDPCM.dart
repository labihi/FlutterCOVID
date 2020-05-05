import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ListDPCM extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ListDCPMState();

}

class ListDCPMState extends State<ListDPCM>{
  List<dynamic> dpcmList = [];

  @override
  Widget build(BuildContext context) {
    //starting asynchronous function to load DPCMs
    loadDPCMs();
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
    //TODO: scopri perché ci sono &nbsp; nelle stringhe (probabile difetto del crawler)
    //download json
    String response = (await http.get('https://federicocapece.dev/api/dpcm')).body;
    //parse json
    Iterable dpcmIterable = json.decode(response);
    //add dpcms to the list
    dpcmIterable.forEach((dpcm) => dpcmList.add(dpcm));
  }

  //this function build a ListTile from the index of a dpcm
  Widget buildWidgetFromDPCM(BuildContext context, int index){
    print("BUILDING: " + dpcmList[index].toString());
    return ListTile(
      title: Text(dpcmList[index]['title']),
      subtitle: Text(dpcmList[index]['description']),
    );
  }

}