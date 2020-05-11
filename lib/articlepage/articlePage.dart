import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  final dynamic article;

  const ArticlePage(this.article);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text(article['text']),
        ),
      body: Scrollbar(child: Text(article['text'].toString()))
    );
  }

}