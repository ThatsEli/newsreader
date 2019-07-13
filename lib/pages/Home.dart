import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newsreader/classes/Article.dart';
import 'package:http/http.dart' as http;
import 'package:newsreader/widgets/ArticlePreview.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  List<Article> _articles = <Article>[];

  @override
  Widget build(BuildContext context) {
    this._refreshArticles();
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: _buildNewsFeed()
            ),
          ),
        ]
      )
    );
  }

  Widget _buildNewsFeed() {
    return RefreshIndicator(
      child: this._articles.length != 0 ? ListView.builder(
        itemCount: _articles.length,
        itemBuilder: (context, index) {
          return ArticlePreview(_articles[index]);
        },
      ) : Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.event_note, size: 100),
            Text('Loading...', style: TextStyle(fontSize: 30)
            )
          ]
        ),
      ),
      onRefresh: _refreshArticles
    );
  }

  Future<Null> _refreshArticles() async {
    Completer<Null> completer = new Completer<Null>();
    List<Article> articles = await this._getArticles();
    setState(() {
      this._articles = articles;
    });
    completer.complete();
    return completer.future;
  }

  Future<List<Article>> _getArticles() async {
    final Response response = await http.get("https://s.thatseliyt.de:34785/api/");
    if (response.statusCode == 200) {
      List articlesJSON = json.decode(response.body) as List;
      List<Article> articles = <Article>[];
      for (var i = 0; i < articlesJSON.length; i++) {
        articles.add(Article.fromJson(articlesJSON[i]));
      }
      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }

}
