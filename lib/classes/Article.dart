
class Article {

  String title;
  String description;
  String author;
  String date;
  String content;
  String pictureUrl;

  Article(String title, String description, String author, String date, String content, String pictureUrl) {
    this.title = title;
    this.description = description;
    this.author = author;
    this.date = date;
    this.content = content;
    this.pictureUrl = pictureUrl;
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return new Article(json['preTitle'] + ': ' + json['title'], json['description'], json['author'], json['date'], json['content'], json['pictureUrl']);
  }

}
