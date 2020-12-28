import 'package:covid19appwithfirebase/widgets/custom_AppBar.dart';
import 'package:flutter/cupertino.dart';
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
            height: 170,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(220.0),
                  bottomRight: Radius.circular((0.0)),
                )),
            child: Container(
              child: CustomAppBar(),
            ),
          ),
          SizedBox(height: 10,),
          OutlineButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              reportYourself(context);
            },
            child: Text("Report Yourself",style: TextStyle(color: Theme.of(context).primaryColor),),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),

          SizedBox(height: 10,),
          OutlineButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              reportOthers(context);
            },
            child: Text("Report others",style: TextStyle(color: Theme.of(context).primaryColor),),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),


        ],
      ),
    );
  }

  void reportYourself(context){
   showModalBottomSheet(context: context, builder: (BuildContext bc){
     return Container(
       color: Theme.of(context).primaryColor,
       height: MediaQuery.of(context).size.height * .2,
       child: Column(
         children: [
           SizedBox(height: 20,),
           Container(
               width: MediaQuery.of(context).size.width,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Center(
                     child:  Text("Do you wish to report your symptoms?",style:
                     TextStyle(
                          fontSize: 20,
                         fontWeight: FontWeight.bold,
                         color: Colors.white),
                     ),
                   ),
                 ),
           ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FlatButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                reportSelfForm(context);
              },
              child: Text("Yes",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
            ),
          ],
        )
         ],
       ),
     );
   });
  }


  void reportOthers(context){
   showModalBottomSheet(context: context, builder: (BuildContext bc){
     return Container(
       color: Theme.of(context).primaryColor,
       height: MediaQuery.of(context).size.height * .2,
       child: Column(
         children: [
           SizedBox(height: 20,),
           Container(
               width: MediaQuery.of(context).size.width,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Center(
                     child:  Text("Do you wish to report Other's symptoms?",style:
                     TextStyle(
                          fontSize: 20,
                         fontWeight: FontWeight.bold,
                         color: Colors.white),
                     ),
                   ),
                 ),
           ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FlatButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {},
              child: Text("Yes",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
            ),
          ],
        )
         ],
       ),
     );
   });
  }

  void reportSelfForm(context){
    showDialog(context: context,builder: (BuildContext bc){
      return SingleChildScrollView(
        child: AlertDialog(

          content: Container(
            width: MediaQuery.of(context).size.width * .9,
            child: Column(
              children: [
                Text("Report Yourself",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Full Name",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Contact no",
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
