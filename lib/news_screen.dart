import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nikatdemo/services/api_service.dart';
import 'components/customListTitle.dart';
import 'model/article_model.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  ApiService client = ApiService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext contex, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;

              return ListView.builder(
                  itemCount: articles!.length,
                  itemBuilder: (context, inedx) =>
                  costumListTitle(articles[inedx])
              );
            }
          return Center(
          child: CircularProgressIndicator(),
    );
  }

  )

  ,

  );
}}

