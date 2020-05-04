import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

class ListDPCM extends StatelessWidget{
  List<ListTile> dpcmTiles = [];

  @override
  Widget build(BuildContext context) {
    log("DIOCANE");
    loadDPCM();
    return Scrollbar(
      child: ListView(
        children: dpcmTiles,
      ),
    );
  }

  Future<void> loadDPCM() async {
    log("LOADING DPCM");

    //download json
    log("DOWNLOAD START");

    HttpClient client = new HttpClient();
    client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    var request = await client.getUrl(Uri.parse('https://federicocapece.dev/'));
    var response = await request.close();

    log(response.headers.toString());
    log("LEN:"+response.contentLength.toString());

    await for (var contents in response.transform(Utf8Decoder())) {
      log("A"+contents);
    }

    log(response.statusCode.toString());
    log("DOWNLOADED");
    client.close(force: true);

    /*
    http.get("https://federicocapece.dev/api/dpcm").then(
        (response){
          log("HTTPS GOT RESULT");
          Iterable dpcms = json.decode(response.body);
          dpcms.forEach(
            (dpcm) {
              log(dpcm);
            }
          );
        }
    );*/

    //parse it

    //add the ListTiles to dpcm

    //KEBAB
    for(var i=0; i<10; i++){
      dpcmTiles.add(
          ListTile(
            title: Text("Title"),
            subtitle: Text("subtitle"),
            //onTap: ,
          )
      );
    }

  }

}