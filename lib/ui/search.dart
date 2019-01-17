import "package:flutter/material.dart";

class Search extends StatefulWidget {
  @override
  _SearchState createState() => new _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextFormField(
          decoration: const InputDecoration(
            fillColor: Colors.green,
            labelText: 'ユーザーハッシュタグを探す',
          ),
        ),
      ),
      body: ListView(
        children: List.generate(10, (index) {
          return _listItem(index);
        }),
      ),
    );
  }

  Widget _listItem(int index) {
    return Column(
      children: <Widget>[
        Divider(height: 10.0,),
        ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage("assets/$index.png"),),
          title: Text("$indexさん", style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("id: $index"),
        )
      ],
    );
  }
}
