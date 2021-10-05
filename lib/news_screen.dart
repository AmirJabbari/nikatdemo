import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      childAspectRatio: (3.8),
      children: List.generate(10, (int position) {
        return generateItem();
      }),
    );
  }
}
void fetchItems() async{
  var url=Uri.parse("https://newsapi.org/v1/articles?source=cnn&sortBy=top&apiKey=3309b7e1283f41c7b1d4b5e63c915c33");
  Response response=await get(url);
  print(json.decode(utf8.decode(response.bodyBytes)));
}

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
                    style: TextStyle(
                      fontSize: 10.0
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.date_range),
                  Text(
                    "2021-10-05T09:33:59Z",
                    style: TextStyle(
                      fontSize: 10.0
                    ),
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

/*child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 150,
            height: 150,
            child: Image.network("https://cdn.cnn.com/cnnnext/dam/assets/210915102012-instagram-photo-illustration-super-tease.jpg",fit: BoxFit.fitHeight,height: 150,),
          ),

        ],
      ),
    ),
  );
}*/
