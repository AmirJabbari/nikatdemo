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

Card generateItem() {
  return Card(
    margin: EdgeInsets.only(bottom: 6),
    elevation: 2.0,
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://cdn.cnn.com/cnnnext/dam/assets/210915102012-instagram-photo-illustration-super-tease.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0)),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What we know about the Facebook whistleblower",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.person),
                      Text(
                        "Rishi Iyengar, CNN Business",
                        style: TextStyle(fontSize: 10.0),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.date_range),
                      Text(
                        "2021-10-05T09:33:59Z",
                        style: TextStyle(fontSize: 10.0),
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    ),
  );
}
