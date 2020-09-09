import 'package:covid19appwithfirebase/utils/custom_text.dart';
import 'package:flutter/material.dart';

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
            ) ,
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.home,color: Theme.of(context).primaryColor,),
            title: CustomText(text: "Home"),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.group,color: Theme.of(context).primaryColor,),
            title: CustomText(text: "Manpowers"),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.monetization_on,color: Theme.of(context).primaryColor,),
            title: CustomText(text: "Money Exchange Rate"),
          ),

          Divider(thickness: 2,),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.people,color: Theme.of(context).primaryColor,),
            title: CustomText(text: "Profile"),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.notifications_none,color: Theme.of(context).primaryColor,),
            title: CustomText(text: "Notifications"),
          ),

          Divider(thickness: 2,),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.query_builder,color: Theme.of(context).primaryColor,),
            title: CustomText(text: "FAQ"),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.arrow_back,color:Theme.of(context).primaryColor,),
            title: CustomText(text: "Log Out",),
          ),

        ],),
      ),
    );
  }
}
