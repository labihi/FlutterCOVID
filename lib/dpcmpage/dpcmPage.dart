import 'package:flutter/material.dart';
import 'package:fluttertestapp/api/api.dart';
import 'package:fluttertestapp/articlepage/articlePage.dart';

class DPCMPage extends StatefulWidget{
  final id;

  DPCMPage(this.id);

  @override
  State<StatefulWidget> createState() {
    return DPCMPageState(this.id);
  }



}

class DPCMPageState extends State<DPCMPage>{
  List<dynamic> articles = [];

  final id;
  DPCMPageState(this.id);

  @override
  void initState() {
    API.loadArticles(this.id).then((downloadedArticles){
      setState(() {
        articles.clear();
        downloadedArticles.forEach((article) => articles.add(article));
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Impostazioni'),
      ),
      body: ListView.separated(
          itemBuilder: createArticle,
          separatorBuilder: (context, index) =>  Divider(),
          itemCount: articles.length,
      ),
    );
  }


  Widget createArticle(BuildContext context, int index) {
    return ListTile(
      title: Text(articles[index]["title"]),
      onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new ArticlePage(articles[index]))),
    );
  }
}
