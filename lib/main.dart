import 'package:covid19appwithfirebase/news/newsDetails.dart';
import 'package:covid19appwithfirebase/survey_related/question_page.dart';
import 'package:covid19appwithfirebase/views/google_signIn.dart';
import 'package:covid19appwithfirebase/widgets/buttom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Color(0xFF01579B),
      ),
      routes: {
        //'/':(context) => BottomBar(),
         NewsDetails.routeName :(context) => NewsDetails(),
      },
      home:  MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    box.writeIfNull('checkPage', false);
    bool checked = box.read('checkPage');
    return Scaffold(
      body: checked?BottomBar():QuestionPage(),
    );
  }
}
