import 'package:covid19appwithfirebase/main.dart';
import 'package:covid19appwithfirebase/utils/custom_text.dart';
import 'package:covid19appwithfirebase/views/reportsTillDate.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Divider(
              thickness: 2,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportsTillDate()),
                );
              },
              leading: Icon(
                Icons.dashboard,
                color: Theme.of(context).primaryColor,
              ),
              title: CustomText(text: "Reports Till Date"),
            ),
            ListTile(
              onTap: () {
                selectAction(0, context);
              },
              leading: Icon(
                Icons.refresh,
                color: Theme.of(context).primaryColor,
              ),
              title: CustomText(text: "Restart Survey"),
            ),
            // ListTile(
            //   onTap: () {},
            //   leading: Icon(
            //     Icons.arrow_back,
            //     color: Theme.of(context).primaryColor,
            //   ),
            //   title: CustomText(
            //     text: "Log Out",
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

void selectAction(int value, BuildContext context) {
  GetStorage().write('checkPage', false);
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (ctx) => MainPage()));
}
