import 'package:flutter/material.dart';
import 'package:newsreader/classes/Article.dart';
import 'package:newsreader/pages/ArticlePage.dart';

class ArticlePreview extends StatelessWidget {
  final Article article;

  ArticlePreview(this.article);

  @override
  Widget build(BuildContext context) {
    final TextStyle _titleStyle = new TextStyle(color: Colors.white, fontSize: 20);
    final TextStyle _infoStyle = new TextStyle(color: Color.fromRGBO(150, 150, 150, 1), fontSize: 15);

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => new ArticleWidget(this.article)));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Hero(
              tag: this.article.title + '_picture',
              child: Image.network(this.article.pictureUrl)
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(this.article.title, style: _titleStyle)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(this.article.author, style: _infoStyle),
              Text(this.article.date, style: _infoStyle, textAlign: TextAlign.right)
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: Divider(color: Colors.white,),
          )
          ],
      ),
    );
  }
}
