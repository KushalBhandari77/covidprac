import 'package:covid19appwithfirebase/main.dart';
import 'package:covid19appwithfirebase/services/google_login_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignIN extends StatefulWidget {
  @override
  _GoogleSignINState createState() => _GoogleSignINState();
}

class _GoogleSignINState extends State<GoogleSignIN> {

  FirebaseAuth _auth=FirebaseAuth.instance;
  FirebaseUser _user;
  GoogleSignIn _googleSignIn=GoogleSignIn();


  bool isSignedIn = false;

  Future<void> handleSignIn() async{
    GoogleSignInAccount googleSignInAccount=await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;

    AuthCredential credential=GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken,accessToken: googleSignInAuthentication.accessToken);
    UserCredential result=(await _auth.signInWithCredential(credential));

    _user=result.user;

    setState(() {
      isSignedIn=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(
                      0.9, 0.0), // 10% of the width, so there are ten blinds.
                  colors: [
                    const Color(0xFF01579B),
                    const Color(0xFFE1F5FE)
                  ], // red to yellow
                  tileMode:
                      TileMode.mirror, // repeats the gradient over the canvas
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 60, 30, 300),
                  child: Text(
                    "Welcome !\nLogin Here,",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                  child: SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width*0.6,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      onPressed: (){
                        handleSignIn();
                      },
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(image: AssetImage("images/google_logo.png"),height: 30,),
                          Text("Login Using Google",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
