import "package:flutter/material.dart";
import "package:notelike_app/ui/components/create/newtext.dart";

class Create extends StatefulWidget {
  @override
  _CreateState createState() => new _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/text.png"),
                    maxRadius: 50.0,
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) {
                                return NewText();
                              },
                              fullscreenDialog: true
                          )
                        );
                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                    ),
                    shape: new CircleBorder(),
                    elevation: 0.0,
                  ),
                ],
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/image.png"),
                maxRadius: 50.0,
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/comment.png"),
                maxRadius: 50.0,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage("assets/music.png"),
                maxRadius: 50.0,
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/movie.png"),
                maxRadius: 50.0,
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "キャンセル",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
