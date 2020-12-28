import 'package:covid19appwithfirebase/services/google_login_services.dart';
import 'package:covid19appwithfirebase/utils/custom_text.dart';
import 'package:covid19appwithfirebase/views/google_signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../main.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Username"),
            accountEmail: Text("username@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(""),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.home, color: Theme
                .of(context)
                .primaryColor,),
            title: CustomText(text: "Home"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.group, color: Theme
                .of(context)
                .primaryColor,),
            title: CustomText(text: "Man powers"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.monetization_on, color: Theme
                .of(context)
                .primaryColor,),
            title: CustomText(text: "Money Exchange Rate"),
          ),

          Divider(thickness: 2,),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.people, color: Theme
                .of(context)
                .primaryColor,),
            title: CustomText(text: "Profile"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.notifications_none, color: Theme
                .of(context)
                .primaryColor,),
            title: CustomText(text: "Notifications"),
          ),

          Divider(thickness: 2,),
          ListTile(
            onTap: () {
              selectAction(0, context);
            },
            leading: Icon(Icons.refresh, color: Theme
                .of(context)
                .primaryColor,),
            title: CustomText(text: "Restart Survey"),
          ),
          ListTile(
            onTap: () {

            },
            leading: Icon(Icons.arrow_back, color: Theme
                .of(context)
                .primaryColor,),
            title: CustomText(text: "Log Out",),
          ),

        ],),
      ),
    );
  }
}

void selectAction(int value, BuildContext context) {
  GetStorage().write('checkPage', false);
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => MainPage()));
}

