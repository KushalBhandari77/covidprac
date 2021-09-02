// import 'dart:html';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//
//   @override
//   void initState(){
//     super.initState();
//     navigateUser();
//   }
//
//   navigateUser() {
//     Firebase.auth().onAuthStateChanged().then((currentUser){
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Center(
//           child: Text("design splash screen here"),
//         ),
//       ),
//     );
//   }
// }


//@nd try
// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   startTimer();
// }
//
// void startTimer() {
//   Timer(Duration(seconds: 3), () {
//     navigateUser(); //It will redirect  after 3 seconds
//   });
// }
//
// void navigateUser() async{
//   if (FirebaseAuth.instance.currentUser != null) {
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Screen1()));
//   } else {
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
//   }
// }