import 'package:flutter/material.dart';
import 'package:fluttertestapp/mainpage/listDPCM.dart';
import 'package:fluttertestapp/mainpage/mainPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

//TODO: discover if variables are shared between multiple imports

MaterialColor mainSwatch = Colors.blue;

Map<String, String> humanReadableRegions = {
  "abruzzo"    :     "Abruzzo",
  "basilicata" :     "Basilicata",
  "calabria"   :     "Calabria",
  "campania"   :     "Campania",
  "emilia"     :     "Emilia-Romagna",
  "friuli"     :     "Friuli-Venezia Giulia",
  "lazio"      :     "Lazio",
  "liguria"    :     "Liguria",
  "lombardia"  :     "Lombardia",
  "marche"     :     "Marche",
  "molise"     :     "Molise",
  "piemonte"   :     "Piemonte",
  "puglia"     :     "Puglia",
  "sardegna"   :     "Sardegna",
  "sicilia"    :     "Sicilia",
  "toscana"    :     "Toscana",
  "trentino"   :     "Trentino-Alto Adige",
  "umbria"     :     "Umbria",
  "valle"      :     "Valle d'Aosta",
  "veneto"     :     "Veneto",
};

List<String> regionKeys = humanReadableRegions.keys.toList();

MainPage mainPage = MainPage();

SharedPreferences preferences;