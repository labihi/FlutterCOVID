import 'package:flutter/material.dart';
import 'package:fluttertestapp/global.dart';
import 'package:fluttertestapp/mainpage/mainPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  //loading user settings, then starting the app;
  SharedPreferences.getInstance().then((pref) {
      preferences = pref;
      runApp(MyDecreto());
  });
}

class MyDecreto extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MyDecreto',
        theme: ThemeData(
          primarySwatch: mainSwatch,
        ),
        home: mainPage
    );
  }
}
