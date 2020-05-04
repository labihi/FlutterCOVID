import 'dart:developer';

import 'package:flutter/material.dart';

class ListDPCM extends StatelessWidget{
  List<ListTile> dpcm = [];

  @override
  Widget build(BuildContext context) {
    log("DIOCANE");
    loadDPCM();
    return Scrollbar(
      child: ListView(
        children: dpcm,
      ),
    );
  }

  void loadDPCM() {
    log("LOADING DPCM");

    //download json

    //parse it

    //add the ListTiles to dpcm

    //KEBAB
    for(var i=0; i<10; i++){
      dpcm.add(
          ListTile(
            title: Text("Title"),
            subtitle: Text("subtitle"),
            //onTap: ,
          )
      );
    }

  }

}