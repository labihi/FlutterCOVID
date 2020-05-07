import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../global.dart';
import 'listDPCM.dart';
import 'mainDrawer.dart';

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MyDecreto',
        theme: ThemeData(
          primarySwatch: mainSwatch,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Homepage"),
            actions: <Widget>[
              Icon(Icons.search)
            ],
          ),
          drawer: Drawer(
            child:  MainPageDrawer(),
          ),
          body: ListDPCM(),

        )
    );
  }
}
