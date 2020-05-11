import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';

import '../global.dart';

class API{

  static Future<List<dynamic>> loadDPCMs() async {
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

    return downloadedDPCM;
  }

  static Future<List<dynamic>> loadArticles(dpcmId) async {
    List<dynamic> downloadedArticles = [];

    log("GETTING ARTICLE FOR DPCM: " + dpcmId.toString());
    String response = (await http.get('https://federicocapece.dev/api/article/' + dpcmId.toString())).body;
    Iterable dpcmIterable = json.decode(response);
    dpcmIterable.forEach((dpcm) => downloadedArticles.add(dpcm));

    return downloadedArticles;
  }

}