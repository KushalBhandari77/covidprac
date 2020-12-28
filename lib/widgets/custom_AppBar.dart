import 'package:covid19appwithfirebase/survey_related/storage.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  Color color=Colors.greenAccent;


  var result="";

  Analysis() {
    if (readResult(0.toString()) == true && readResult(1.toString()) == true && readResult(2.toString()) == true) {
      result= "You immediately need\n to consult the doctor"; color=Colors.red;
    }else if(readResult(0.toString())==false && readResult(1.toString())==false && readResult(2.toString())==false){
      result= "Congratulation's you're \n Safe";
    }else{
      result="Apply safety measures\nAnd maintain self Isolation"; color=Colors.orange;
    }
  }


  @override
  void initState() {
    super.initState();
    Analysis();
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10,0,30,0),
          child: Container(
            height: 180,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/nurse.png"),
                fit: BoxFit.cover,
              ),

            ),
          ),
        ),

        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 10),
                child: Text("Prescription Based \nOn The Survey :",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
              ),

              Text(result,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                ),),
            ],
          ),
        ),
      ],
    );
  }
}
