import 'package:covid19appwithfirebase/widgets/buttom_nav_bar.dart';
import 'package:flutter/material.dart';

class SurveyEnd extends StatefulWidget {
  @override
  _SurveyEndState createState() => _SurveyEndState();
}

class _SurveyEndState extends State<SurveyEnd> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: 190,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(165),
                    ),),
                child: Container(
                  child: Row(
                    children: [
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 30,bottom: 10),
                              child: Text("Final one",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),),
                            ),

                            Text("Thank you for answering",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent
                              ),),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 0, 40,0),
                child: Text("Do you have any problem while breathing from some days?",style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBar()));
                    },
                    child: Text("Yes",style: TextStyle(color: Colors.white),),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBar()));
                    },
                    child: Text("No",style: TextStyle(color: Colors.white),),

                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}
