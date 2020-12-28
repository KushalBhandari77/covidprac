import 'package:covid19appwithfirebase/views/report_body.dart';
import 'package:covid19appwithfirebase/widgets/navigation_bar_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: Container(
        child: NavigationBar(),
      ),
      appBar: AppBar(title: Text("Hello Kushal"),
        elevation: 0,
      ),
      body: ReportBody(),

    );
  }
}
