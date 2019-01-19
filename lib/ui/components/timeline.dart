import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:notelike_app/model/timeline.dart';

class TimeLine extends StatefulWidget {
  final FirebaseApp app;
  TimeLine({this.app});

  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  List<TimeLine> timelineData;
  DatabaseReference _timelineRef;
  StreamSubscription<Event> _timelineSubscription;

  @override
  void initState() {
    super.initState();
    _timelineRef = FirebaseDatabase.instance.reference().child('timelines');
    _timelineSubscription = _timelineRef.limitToLast(10).onChildAdded.listen((Event event) {
      print('Child add !! ${event.snapshot.value}');
      Map<dynamic, dynamic> map = event.snapshot.value as Map;
      timelineData = map.values.toList().
    }, onError: (Object o ) {
      final DatabaseError error = o;
      print('Error #{error.code}, ${error.message}');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: List.generate(10, (indx) {
        return _timelineCradView()
      }),
    );
  }

  Widget _timelineCradView() {

  }
}