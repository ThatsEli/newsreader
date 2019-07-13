import 'package:flutter/material.dart';
import 'package:newsreader/classes/Article.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  ArticleWidget(this.article);

  @override
  Widget build(BuildContext context) {
    TextStyle _titleTextStyle = new TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800);
    TextStyle _subHeaderTextStyle = new TextStyle(color: Color.fromRGBO(150, 150, 150, 1), fontSize: 15);
    TextStyle _contentTextStyle = new TextStyle(color: Color.fromRGBO(220, 220, 220, 1), fontSize: 20);

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 8, right: 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Hero(
                      tag: this.article.title + '_picture',
                      child: this.article.pictureUrl != '' ? Image.network(this.article.pictureUrl) : Container()
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(this.article.author, style: _subHeaderTextStyle),
                        Text(this.article.date, style: _subHeaderTextStyle, textAlign: TextAlign.right)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(this.article.title, style: _titleTextStyle)
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(this.article.content, style: _contentTextStyle),
                  )
                ],
              )
            ),
        ),
      ),
    );
  }
}

