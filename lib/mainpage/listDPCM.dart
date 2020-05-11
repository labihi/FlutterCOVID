import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertestapp/api/api.dart';
import 'package:fluttertestapp/dpcmpage/dpcmPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global.dart';

class ListDPCM extends StatefulWidget{
  final ListDCPMState state = ListDCPMState();

  @override
  State<StatefulWidget> createState() {
    return state;
  }

}

class ListDCPMState extends State<ListDPCM>{
  List<dynamic> dpcmList = [];

  @override
  void initState() {
    super.initState();

    //starting asynchronous function to load DPCMs
    loadDPCMs();

  }

  void loadDPCMs(){
    log("GETTING DPCM!!!");
    API.loadDPCMs().then((dpcms){
      setState((){
        dpcmList.clear();
        dpcms.forEach(dpcmList.add);
      });
    });
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

  //this function build a ListTile from the index of a dpcm
  Widget buildWidgetFromDPCM(BuildContext context, int index){
    //log("BUILDING: " + dpcmList[index].toString());
    return ListTile(
      title: Text(dpcmList[index]['title']),
      subtitle: Text(dpcmList[index]['description']),
      onTap: () => openDPCM(dpcmList[index]),
    );
  }

  void openDPCM(dynamic dpcm) {
    if(dpcm['url'].toString().endsWith('.pdf')){
      log("PDF");
    }else{
      log("NOTAPDF");
      Navigator.push(context, MaterialPageRoute(builder: (context) => DPCMPage(dpcm['id'])));
    }
  }

}