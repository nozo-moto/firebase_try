
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum DialogLogoutAction {
  cancel,
  agree,
}


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
      backgroundColor: Color(0xe0e0e0),
      appBar: AppBar(
        title: new Text("アカウント"),
      ),
      body: _user == null ? _buildGoogleSignInButton() : _buildAccountInfoLogin(context),
      // body: _buildAccountInfoLogin(),
    );
  }

  Widget _buildAccountInfoLogin(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);

    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text("note user profile"),
                leading: CircleAvatar(),
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
                onTap: (){
                  showLogoutDialog<DialogLogoutAction>(
                    context: context,
                    child: AlertDialog(
                      content: Text(
                        'ログアウトしますか',
                        style: dialogTextStyle,
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text("NO"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: const Text('YES'),
                          onPressed: () {
                            _googleSignIn.signOut().then((result) {
                              setState(() {
                                _user = null;
                              });
                              Navigator.of(context).pop();
                            });
                          },
                        )
                      ],
                    )
                  );
                  
                },
              ),
            ),
            SizedBox(height: 30.0,),
          ],
        ),
      );
  }

  Widget _buildGoogleSignInButton() {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50.0,),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              size: 60,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 50.0,),
          Text("自分の記事や",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          Text("スキした記事を",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          Text("確認できます。",
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 50.0,),
          Container(
            child: FlatButton(
              child: Text("ログイン", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              color: Colors.teal,
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
            width: 300,
            height: 60,
          )
        ],
      )
    );
  }
  
  void showLogoutDialog<T>({ BuildContext context, Widget child }) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
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