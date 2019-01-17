
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => new _AccountState();
}

class _AccountState extends State<Account> {
  FirebaseUser _user;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: new Text("アカウント"),
      ),
      body: _user == null ? _buildGoogleSignInButton() : _buildAccountInfoLogin(),
      // body: _buildAccountInfoLogin(),
    );
  }

  Widget _buildAccountInfoLogin() {
    return SingleChildScrollView(
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
      );
  }

  Widget _buildGoogleSignInButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: RaisedButton(
            child: Text("Sing in"),
            onPressed: () {
              _handleSignIn()
              .then((FirebaseUser user) {
                setState(() {
                  _user = user;
                });
              }).catchError((error) {
                print(error);
              });
            },
          ),
        )
      ],
    );
  }

  Future<FirebaseUser> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print("signed in " + user.displayName);
    return user;
  }
}