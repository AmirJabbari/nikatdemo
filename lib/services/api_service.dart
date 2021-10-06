import 'dart:convert';
import 'package:http/http.dart';
import 'package:nikatdemo/model/article_model.dart';

class ApiService {
  Uri endPoint = Uri.parse("https://newsapi.org/v1/articles?source=cnn&sortBy=top&apiKey=3309b7e1283f41c7b1d4b5e63c915c33");


  Future<List<Article>> getArticle() async{
    Response res=await get(endPoint);
    if(res.statusCode==200){
      Map<String,dynamic> json=jsonDecode(res.body);
      List<dynamic> body=json['articles'];
      List<Article> articles=body.map((dynamic item) => Article.fromJson(item)).toList();
      print(articles);
      return articles;
    }else{
      throw("error");
    }
  }
}
