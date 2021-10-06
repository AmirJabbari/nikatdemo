import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nikatdemo/model/article_model.dart';

Widget costumListTitle(Article article){
  String formattedDate="";

  if(article.publishedAt!="Null"){
    DateTime dateTime=DateTime.parse(article.publishedAt);
    if(dateTime!="Null"){
      var formatter = new DateFormat('yyyy-MM-DD');
      formattedDate = formatter.format(dateTime);
      formattedDate = formattedDate.substring(0, formattedDate.length - 1);

    }else{
      formattedDate = "null";

    }
  }else{
    formattedDate = "null";

  }


  return Container(
    margin: EdgeInsets.all(12),
    padding: EdgeInsets.all(8),
    decoration:  BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 3
        )
      ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(
            image: NetworkImage(article.urlToImage)
          ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 12,),
        Text(
          article.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15,),
        Row(
          children: [
            Icon(Icons.person),
            Container(
              width: 100,
              child: Text(
                article.author,
                style: TextStyle(fontSize: 10,),
              ),
            ),
            SizedBox(width: 30,),
            Icon(Icons.date_range),
            Text(
              formattedDate,
              style: TextStyle(fontSize: 10,),
            ),

          ],
        )
      ],
    ),
  );
}