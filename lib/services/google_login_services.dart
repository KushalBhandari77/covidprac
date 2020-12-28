import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginServices{

  GoogleSignIn _googleSignIn=GoogleSignIn(scopes: ['email']);

  _login()async{
    try{
      await _googleSignIn.signIn();
    }catch(err){
      print(err);
    }
  }

  _logout()async{
    try{
      await _googleSignIn.signOut();
    }catch(err){
      print(err);
    }
  }



}