import 'dart:io';

import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';

class NewText extends StatefulWidget {
  @override
  _NewTextState createState() => new _NewTextState();
}

class _NewTextState extends State<NewText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("テキスト"),
        actions: <Widget>[
          GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(
                    top: 16.0, bottom: 16.0, left: 10, right: 10),
                child: Text(
                  '保存',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              )),
          GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(
                    top: 16.0, bottom: 16.0, left: 10, right: 10),
                child: Text(
                  '次へ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: NewTextMain(),
      ),
    );
  }
}

class NewTextMain extends StatefulWidget {
  @override
  _NewTextMain createState() => _NewTextMain();
}

class _NewTextMain extends State<NewTextMain> {
  String _title;
  String _content;
  File _thumbnail;

  Future getThumbnail() async {
    var image = await ImagePicker.PickImage(source: ImageSource.gallery);
    setState(() {
      _thumbnail = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
        child: GestureDetector(
          onTap: getThumbnail,
          child: _thumbnail == null
            ? IconButton(
              icon: new Icon(
                Icons.insert_photo,
                size: 30,
              ),
              color: Colors.grey,
            )
            : Image.file(_thumbnail),
      )),
      Container(
        child: TextFormField(
          decoration: InputDecoration(
            hintText: '記事タイトル',
            hintStyle: TextStyle(
              fontSize: 20,
            ),
            border: InputBorder.none,
          ),
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        height: 50,
      ),
      Container(
        child: TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
            hintText: '記事本文',
            border: InputBorder.none,
          ),
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        height: 1000,
      )
    ]));
  }
}
