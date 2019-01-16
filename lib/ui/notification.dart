import "package:flutter/material.dart";

class NotificationList extends StatefulWidget {
  @override
  _NotificationListState createState() => new _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Notification"),
      ),
    );
  }
}