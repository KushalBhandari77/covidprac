import 'package:covid19appwithfirebase/widgets/custom_AppBar.dart';
import 'package:flutter/material.dart';

class ReportBody extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<ReportBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 190,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(165.0),
                  bottomRight: Radius.circular((0.0)),
                )),
            child: Container(
              child: CustomAppBar(),
            ),
          ),
          ListTile(
            title: Text("Report Your Suspection",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
              ),
            ),
          ),
          SizedBox(height: 10,),
          OutlineButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {},
            child: Text("Report Yourself",style: TextStyle(color: Theme.of(context).primaryColor),),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          ListTile(
            title: Text("Report Other\'s Suspection",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
              ),
            ),
          ),
          SizedBox(height: 10,),
          OutlineButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {},
            child: Text("Report others",style: TextStyle(color: Theme.of(context).primaryColor),),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          ListTile(
            title: Text("Report Suspectious Arrived From Flight",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
              ),
            ),
          ),
          SizedBox(height: 10,),
          OutlineButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {},
            child: Text("Report Now",style: TextStyle(color: Theme.of(context).primaryColor),),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
