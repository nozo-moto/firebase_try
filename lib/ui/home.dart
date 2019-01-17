import "package:flutter/material.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("タイムライン"),
      ),
      body: ListView(
        children: List.generate(10, (index) {
          return _cardView(index);
        }),
      ),
    );
  }
  
  Widget _cardView(int index) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(backgroundImage: AssetImage("assets/0.png"),),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("note user $index さん", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("not user です")
                  ],
                )
              ],
            ),
            SizedBox(height: 5.0,),
            Image.asset("assets/$index.png", fit: BoxFit.cover, height: 150.0,),
            SizedBox(height: 10.0,),
            Text("これはタイトルです$index", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Text("SQFLite is a Database plugin for flutter. It is highly reliable and embedded Database engine.For CRUD operation we are using async and await. Typically these keywords are used to write asynchronous code.Let’s try one sample to save and retrieve employee data from SQFLite.For that ,we have to import the below dependencies to get it done."),
            SizedBox(height: 20.0,),
            Text("スキ   $index件", style: TextStyle(fontWeight: FontWeight.bold),),
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