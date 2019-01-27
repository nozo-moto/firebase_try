import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:notelike_app/model/timeline.dart';


class TimeLine extends StatefulWidget {
  final FirebaseApp app;
  TimeLine({this.app});

  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  List<TimeLineModel> timelineData = new List();
  DatabaseReference _timelineRef = FirebaseDatabase.instance.reference();
  StreamSubscription<Event> _timelineSubscription;
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    List<TimeLineModel> result = new List();
    _timelineSubscription = _timelineRef.onChildAdded.listen((Event event) {
      Map value = event.snapshot.value as Map;
      value.forEach((k, v) => (
        timelineData.add(
          TimeLineModel(
            v['title'],
            v['content'],
            v['thumbneil'],
            v['suki_count'],
            v['username'],
            v['usericon'],
            v['created_at'],
          )
        )
      ));
      // timelineData =
      result = timelineData;
    }, onError: (Object o ) {
      final DatabaseError error = o;
      print('Error ${error.code}, ${error.message}');
    });

    return ListView(
      children: List.generate(result.length, (index) {
        return _timelineCradView(result[index]);
      }),
    );
  }

  Widget _timelineCradView(TimeLineModel timeline) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(backgroundImage: NetworkImage("${timeline.usericon}"),),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("${timeline.username} さん", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("${timeline.created_at}")
                  ],
                )
              ],
            ),
            SizedBox(height: 5.0,),
            Image.network("${timeline.thumbneil}", fit: BoxFit.cover, height: 150.0,),
            SizedBox(height: 10.0,),
            Text("${timeline.title}", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Text("${timeline.content}"),
            SizedBox(height: 20.0,),
            Text("スキ   ${timeline.suki_count} 件", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 5.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Icon(Icons.favorite_border),SizedBox(width: 5.0,), Text("スキ")],),
                Text("コメントする", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("シェア", style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            )
          ],
        ),
      ),
    );
  }
}