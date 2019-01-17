
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => new _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: new Text("アカウント"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text("note user profile"),
                leading: CircleAvatar(
                  ),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text("好きを付けたノート"),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text("プロフィール設定"),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text("アカウント設定"),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text("プッシュ通知"),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text("よくある質問"),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text("プライバシーポリシー"),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text("ご利用規約"),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text("フィードバック"),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text("ログアウト"),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            SizedBox(height: 30.0,),
          ],
        ),
      ),
    );
  }
}