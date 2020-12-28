import 'package:covid19appwithfirebase/views/stats.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationService extends StatefulWidget {
  @override
  _PushNotificationServiceState createState() => _PushNotificationServiceState();
}

class _PushNotificationServiceState extends State<PushNotificationService> {

  final FirebaseMessaging _firebaseMessaging=FirebaseMessaging();
  List<Message> _messages;

  _getToken(){
    _firebaseMessaging.getToken().then((deviceToken) {
      print("Device Token: $deviceToken");
    });
  }

  _configureFirebaseListeners(){
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
        _setMessage(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        _setMessage(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        _setMessage(message);
      },
    );
  }

  _setMessage(Map<String, dynamic> message){
    final notification=message['notification'];
    final data=message['data'];
    final String title=notification['title'];
    final String body=notification['body'];
    final String mess=data['message'];
    setState(() {
      Message m=Message(title,body);
      _messages.add(m);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messages= List<Message>();
    _getToken();
    _configureFirebaseListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: null == _messages ? 0: _messages.length,
        itemBuilder: (context,index){
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Hello Notification",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Message{
  String title;
  String body;

  Message(this.title,this.body);
}
