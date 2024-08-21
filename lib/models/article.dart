class Article {
  final String title;
  final String content;
  final String urlToImage;

  Article(
      {required this.title, required this.content, required this.urlToImage});
  factory Article.fromJson(json) {
    return Article(
      title: json["title"] ?? "No Title In This Article",
      content: json["content"] ?? "No description In This Article",
      urlToImage: json["urlToImage"] ??
          "https://demofree.sirv.com/nope-not-here.jpg?w=150", //default image
    );
  }
}
