import 'dart:async';
//JSON?
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

//HTTP requests
import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';

class ListDPCM extends StatefulWidget{
  @override
  _ListDPCMState createState() => _ListDPCMState();
}

class _ListDPCMState extends State<ListDPCM> {
  List<ListTile> dpcmTiles = [];

  @override
  Widget build(BuildContext context) {
    //starting asynchronous function to load DPCMs
    loadDPCMs();
    //creating an empty listView that will be populated with DPCMs later
    return Scrollbar(
      child: ListView(
        children: dpcmTiles,
      ),
    );
  }

  Future<void> loadDPCMs() async {
    //download json
    log("DOWNLOAD START");

    //download and wait for download to be finished
    String response = (await http.get('https://federicocapece.dev/api/dpcm')).body;

    //parse json
    Iterable dpcms = json.decode(response);
    dpcms.forEach(addDPCMTile);
  }

  void addDPCMTile(dynamic dpcmData){
    log(dpcmData);
    dpcmTiles.add(
        ListTile(
          title: Text("Title"),
          subtitle: Text("subtitle"),
          //onTap: ,
        )
    );

  }
}