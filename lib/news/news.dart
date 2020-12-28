import 'dart:convert';
import 'dart:async';
import 'package:covid19appwithfirebase/news/newsDetails.dart';
import 'package:covid19appwithfirebase/utils/custom_text.dart';
import 'package:covid19appwithfirebase/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  var news;
  var unknownData;
  bool isLoading = true;

  Future getLatestNews() async {
    String url = "https://nepalcorona.info/api/v1/news";
    var response = await http
        .get(Uri.encodeFull(url), headers: {'Accept': 'application/json'});
   news = json.decode(response.body)['data'];
  }
  void initState() {
    super.initState();
    getLatestNews().then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Covid ",style: TextStyle(color: Colors.black54),),
          Text("News",style: TextStyle(color: Theme.of(context).primaryColor),),
        ],
      ),backgroundColor: Colors.white,centerTitle: true,elevation: 20,),
      body: isLoading? Center(child: Loader()): SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: news.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, NewsDetails.routeName,
                              arguments: {
                                'image': news[index]['image_url'],
                                'title': news[index]['title'],
                                'source': news[index]['source'],
                                'summary': news[index]['summary'],
                              });
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
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              news[index]['image_url']),
                                          fit: BoxFit.cover),
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
