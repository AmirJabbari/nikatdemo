class Article{
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;

  Article({required this.author, required this.title, required this.description, required this.url, required this.urlToImage,
      required this.publishedAt});


  factory Article.fromJson(Map<String,dynamic> json){
    return Article(
        author: json['author'] ==null?"Null":json['author'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        url: json['url'] as String,
        urlToImage: json['urlToImage'] as String,
        publishedAt: json['publishedAt'] ==null?"Null" : json['publishedAt'] as String,

    );

  }
}