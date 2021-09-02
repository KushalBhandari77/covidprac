import 'dart:convert';
import 'dart:io';

import 'package:covid19appwithfirebase/model/report_model.dart';
import 'package:covid19appwithfirebase/views/homepage.dart';
import 'package:covid19appwithfirebase/widgets/buttom_nav_bar.dart';
import 'package:covid19appwithfirebase/widgets/custom_AppBar.dart';
import 'package:covid19appwithfirebase/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReportBody extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<ReportBody> {
  bool _isLoading = false;
  TextEditingController _fullNameController = new TextEditingController();
  TextEditingController _contactNumberController = new TextEditingController();
  TextEditingController _symptomsController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _fullNameController.dispose();
    _emailController.dispose();
    _contactNumberController.dispose();
    _symptomsController.dispose();
    super.dispose();
  }

  Future<Reports> createReport(
      String _fullName, String _contact, String _email, String _symptom) async {
    final response =
        await http.post(Uri.parse('http://192.168.1.103:8000/reports/create/'),
            headers: <String, String>{'Content-Type': 'application/json'},
            body: jsonEncode(<String, String>{
              'full_name': _fullName,
              'contact': _contact,
              'email': _email,
              'symptom': _symptom,
            }));

    if (response.statusCode == 200) {
      setState(() {
        _isLoading = false;
        showDialog(
            context: context,
            builder: (BuildContext bc) {
              return AlertDialog(
                  content: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(children: [
                        Text(
                          "Submitted Successfully",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        FlatButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomBar()));
                          },
                          child: Text(
                            "Ok",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ])));
            });
      });
      return Reports.fromJson(jsonDecode(response.body));
    } else {
      setState(() {
        _isLoading = false;
      });
      return null;
    }
  }

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
          SizedBox(
            height: 30,
          ),
          Container(
            height: 100,
            width: 300,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                reportYourself(context);
              },
              child: Text(
                "Report Yourself",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            width: 300,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                reportOthers(context);
              },
              child: Text(
                "Report Others",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void reportYourself(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: Theme.of(context).primaryColor,
            height: MediaQuery.of(context).size.height * .25,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Do you wish to report your symptoms?",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        reportSelfForm(context);
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    FlatButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "No",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  void reportOthers(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: Theme.of(context).primaryColor,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Do you wish to report Other's symptoms?",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        reportOthersForm(context);
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    FlatButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "No",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  void reportSelfForm(context) {
    showDialog(
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: _isLoading
                ? Center(
                    child: Loader(),
                  )
                : AlertDialog(
                    content: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      child: Column(
                        children: [
                          Text(
                            "Report Yourself",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          TextField(
                            controller: _fullNameController,
                            decoration: InputDecoration(
                              labelText: "Full Name",
                            ),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: _contactNumberController,
                            decoration: InputDecoration(
                              labelText: "Contact no",
                            ),
                          ),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                            ),
                          ),
                          TextField(
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              controller: _symptomsController,
                              decoration: InputDecoration(
                                labelText: "Symptoms",
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FlatButton(
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  createReport(
                                      _fullNameController.text,
                                      _contactNumberController.text,
                                      _emailController.text,
                                      _symptomsController.text);
                                },
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              FlatButton(
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
          );
        });
  }

  void reportOthersForm(context) {
    showDialog(
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: _isLoading
                ? Center(
                    child: Loader(),
                  )
                : AlertDialog(
                    content: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      child: Column(
                        children: [
                          Text(
                            "Report Others",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          TextField(
                            controller: _fullNameController,
                            decoration: InputDecoration(
                              labelText: "Full Name",
                            ),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: _contactNumberController,
                            decoration: InputDecoration(
                              labelText: "Contact no",
                            ),
                          ),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                            ),
                          ),
                          TextField(
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              controller: _symptomsController,
                              decoration: InputDecoration(
                                labelText: "Symptoms",
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FlatButton(
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  createReport(
                                      _fullNameController.text,
                                      _contactNumberController.text,
                                      _emailController.text,
                                      _symptomsController.text);
                                },
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              FlatButton(
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
          );
        });
  }
}
