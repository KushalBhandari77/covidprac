import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(30,0,10,0),
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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 10),
                child: Text("Prescription Based \nOn The Survey :",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
              ),

              Text("You Need To\nConsult The Doctor.",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent
                ),),
            ],
          ),
        ),
      ],
    );
  }
}
