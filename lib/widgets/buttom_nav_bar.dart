import 'package:covid19appwithfirebase/views/homepage.dart';
import 'package:covid19appwithfirebase/views/hospitals.dart';
import 'package:covid19appwithfirebase/news/news.dart';
import 'package:covid19appwithfirebase/views/stats.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/homepage';

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Statss(),
    News(),
    Hospitals(),
  ];

  @override
  void initState() {
    super.initState();

    _currentIndex = 0;
  }

  changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_currentIndex],
      bottomNavigationBar: BubbleBottomBar(
          opacity: 0.3,
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
          currentIndex: _currentIndex,
          hasInk: true,
          inkColor: Color(0xFF00838F),
          onTap: changePage,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.record_voice_over,
                  color: Theme.of(context).primaryColor,
                ),
                activeIcon: Icon(
                  Icons.record_voice_over,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Report",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                )),
            BubbleBottomBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.graphic_eq,
                  color: Theme.of(context).primaryColor,
                ),
                activeIcon: Icon(
                  Icons.graphic_eq,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Stats",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                )),
            BubbleBottomBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.message,
                  color: Theme.of(context).primaryColor,
                ),
                activeIcon: Icon(
                  Icons.message,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "News",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                )),
            BubbleBottomBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.local_hospital,
                  color: Theme.of(context).primaryColor,
                ),
                activeIcon: Icon(
                  Icons.local_hospital,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Hospitals",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                )),
          ]),
    );
  }
}
