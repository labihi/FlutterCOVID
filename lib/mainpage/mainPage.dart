import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertestapp/global.dart';
import 'package:fluttertestapp/mainpage/MainPageDrawer.dart';
import 'package:fluttertestapp/mainpage/listDPCM.dart';

class MainPage extends StatelessWidget{
  ListDPCM listDPCM = ListDPCM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        actions: <Widget>[
          Icon(Icons.search)
        ],
      ),
      drawer: Drawer(
        child:  MainPageDrawer(),
      ),
      body: listDPCM,
    );
  }

}