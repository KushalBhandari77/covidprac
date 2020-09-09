import 'dart:convert';
import 'dart:async';

import 'package:covid19appwithfirebase/model/news_model.dart';
import 'package:covid19appwithfirebase/news/newsDetails.dart';
import 'package:covid19appwithfirebase/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  var news;
  bool isLoading = true;

  Future<NewsModel> getLatestNews() async {
    String url = "https://nepalcorona.info/api/v1/news";
    var response = await http
        .get(Uri.encodeFull(url), headers: {'Accept': 'application/json'});
    setState(() {
      news = json.decode(response.body)['data'];
      isLoading = false;
    });
  }

  void initState() {
    super.initState();
    getLatestNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: news.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsDetails(
                              newsModel: news[index],
                            )));
                  },
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(news[index]['image_url']),fit: BoxFit.cover),
                              ),

                              width: 120,
                            ),

                            title: CustomText(text: news[index]['title']),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
