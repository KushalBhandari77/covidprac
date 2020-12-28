import 'package:flutter/material.dart';

class Hospitals extends StatefulWidget {
  @override
  _HospitalsState createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Hospital's An",style: TextStyle(color: Colors.black54),),
          Text("d Quarantine's",style: TextStyle(color: Theme.of(context).primaryColor),),
        ],
      ),backgroundColor: Colors.white,centerTitle: true,elevation: 20,),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ) ,
    );
  }
}
