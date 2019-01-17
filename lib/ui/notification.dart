import "package:flutter/material.dart";

class NotificationList extends StatefulWidget {
  @override
  _NotificationListState createState() => new _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("お知らせ"),
      ),
      body: ListView(
        children: List.generate(10, (index) {
          return _listItem(index);
        }),
      ),
    );
  }

  Widget _listItem(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage("assets/$index.png"),),
        title: Text("$indexがあなたをフォローしました", style: TextStyle(fontWeight: FontWeight.bold,)),
        subtitle: Text("2018/11/2"),
        trailing: Icon(Icons.person_add),
      ),
    );
  }
}