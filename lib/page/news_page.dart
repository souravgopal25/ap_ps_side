import 'package:ap_ps_side/card/news_card.dart';
import 'package:ap_ps_side/models/news.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class NewsPage extends StatefulWidget {
  const NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<News> futureNews;
  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
    print(futureNews);
    print(futureNews.then((value) => value.totalArticles.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: <Widget>[
              Image.asset(
                "assets/ashoka.jpeg",
                height: 100,
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    "GOVERMENT OF ASSAM",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  Text(
                    "ASSAM POLICE",
                    style: TextStyle(
                        color: Colors.blue[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ],
              )
            ],
          ),
        ),
        toolbarHeight: 120,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder(
          future: futureNews,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.articles.length,
                  itemBuilder: (context, index) {
                    print(index);
                    return NewsCard(articles: snapshot.data.articles[index]);
                  });
            } else if (snapshot.hasError) {
              return Text("Error");
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

Future<News> fetchNews() async {
  final response = await http.get(
      'https://gnews.io/api/v4/search?q=assam&token=2d1339c1d7103badb7f0e04fb2e8787e');
  if (response.statusCode == 200) {
    return News.fromJson(json.decode(response.body));
  } else {
    throw Exception('failed to load News');
  }
}
