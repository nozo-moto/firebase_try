import "package:flutter/material.dart";
import "package:notelike_app/ui/components/timeline.dart";
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  _HomeState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("タイムライン"),
      ),
      body: TimeLine(),
    );
  }
}