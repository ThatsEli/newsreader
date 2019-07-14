import 'package:flutter/material.dart';
import 'package:newsreader/classes/Article.dart';
import 'package:newsreader/pages/ArticlePage.dart';

class ArticlePreview extends StatelessWidget {
  final Article article;

  ArticlePreview(this.article);

  @override
  Widget build(BuildContext context) {
    final TextStyle _titleStyle = new TextStyle(fontSize: 20);
    final TextStyle _infoStyle = new TextStyle(fontSize: 15);

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => new ArticleWidget(this.article)));
      },
      child: Column(
        children: [
          Hero(
            tag: this.article.title + '_picture',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: this.article.pictureUrl != '' ? Image.network(
                this.article.pictureUrl,
                height: MediaQuery.of(context).size.width * 0.56279,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ) : Container()
            ),
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
            child: Divider(),
          )
          ],
      ),
    );
  }
}
