
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:notelike_app/ui/account.dart';
import 'package:notelike_app/ui/home.dart';
import 'package:notelike_app/ui/create.dart';
import 'package:notelike_app/ui/notification.dart';
import 'package:notelike_app/ui/search.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  // final noteColor = const Color(0xFF27AD8B);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.analytics, this.observer})
      : super(key: key);

  final String title;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  _MyHomePageState createState() => _MyHomePageState(analytics, observer);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this.analytics, this.observer);

  final FirebaseAnalyticsObserver observer;
  final FirebaseAnalytics analytics;
  String _message = '';

  int currentIndex = 0;
  List tabLayout = [
    Home(),
    Search(),
    Create(),
    NotificationList(),
    Account()
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: tabLayout[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onTabBootomTab,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            title: new Text('ホーム'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: new Text('探す'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: new Text('つくる'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: new Text('お知らせ'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: new Text('アカウント')
          )
        ],
      ),
    );
  }

  _onTabBootomTab(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => Create(), fullscreenDialog: true));
        return;
    }

    setState(() {
      currentIndex = index;
    });
  }
}
