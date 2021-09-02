import 'dart:convert';

import 'package:covid19appwithfirebase/model/report_model.dart';
import 'package:covid19appwithfirebase/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReportsTillDate extends StatefulWidget {
  const ReportsTillDate({Key key}) : super(key: key);

  @override
  _ReportsTillDateState createState() => _ReportsTillDateState();
}

Future<List<Reports>> getReports() async {
  String url = 'http://192.168.1.103:8000/reports/list/';
  var reports;
  try {
    var response = await http.get(url);

    reports = (json.decode(response.body) as List)
        .map((i) => Reports.fromJson(i))
        .toList();

    return reports;
  } catch (e) {
    print(e);
  }
  return null;
}

class _ReportsTillDateState extends State<ReportsTillDate> {
  bool _isLoading = true;
  var reportsTillDate;

  void initState() {
    super.initState();
    getReports().then((value) {
      if (value == null) {
        _isLoading = true;
      } else {
        setState(() {
          reportsTillDate = value;
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reports Till Date"),
      ),
      body: _isLoading
          ? Center(
              child: Loader(),
            )
          : ListView.builder(
              itemCount: reportsTillDate.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(reportsTillDate[index].fullName),
                  subtitle: Text(reportsTillDate[index].contact.toString()),
                );
              }),
    );
  }
}
