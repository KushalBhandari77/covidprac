import 'dart:convert';
import 'dart:async';
import 'package:covid19appwithfirebase/news/newsDetails.dart';
import 'package:covid19appwithfirebase/utils/custom_text.dart';
import 'package:covid19appwithfirebase/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Hospitals extends StatefulWidget {
  @override
  _HospitalsState createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  var news;
  var unknownData;
  bool isLoading = true;

  Future getHospitals() async {
    String url = "https://corona.askbhunte.com/api/v1/hospitals";
    var response = await http
        .get(Uri.encodeFull(url), headers: {'Accept': 'application/json'});
    news = json.decode(response.body)['data'];
  }

  void initState() {
    super.initState();
    getHospitals().then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Covid ",
              style: TextStyle(color: Colors.black54),
            ),
            Text(
              "Hospitals",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 20,
      ),
      body: isLoading
          ? Center(child: Loader())
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: news.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(news[index]['name']),
                                subtitle: CustomText(
                                  text: news[index]['phone'],
                                ),
                              ),
                            ],
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
