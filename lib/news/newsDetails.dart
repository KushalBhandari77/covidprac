import 'package:covid19appwithfirebase/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:covid19appwithfirebase/model/news_model.dart';

class NewsDetails extends StatelessWidget {

  final NewsModel newsModel;

  NewsDetails({this.newsModel});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(newsModel.image),
            CustomText(text: newsModel.title),
            Text(newsModel.source),
            Text(newsModel.summary)
          ],
        ),
      ),
    );
  }
}
