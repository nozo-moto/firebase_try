import 'package:firebase_database/firebase_database.dart';

class TimeLineModel {
  String key;
  String content;
  int suki_count;
  String thumbneil;
  String title;
  String usericon;
  String username;
  String created_at;

  TimeLineModel(
    this.title,
    this.content,
    this.thumbneil,
    this.suki_count,
    this.username,
    this.usericon,
    this.created_at,
  );

  TimeLineModel.fromSnapShot(DataSnapshot snapshot):
    key = snapshot.key,
    title = snapshot.value['title'],
    content = snapshot.value['content'],
    suki_count = snapshot.value['suki_count'],
    thumbneil = snapshot.value['thumbneil'],
    usericon = snapshot.value['usericon'],
    username = snapshot.value['username'],
    created_at = snapshot.value['created_at'];

  toJson() {
    return {
      "title": title,
      "content": content,
      "thumbneil": thumbneil,
      "suki_count": suki_count,
      "username": username,
      "usericon": usericon,
      "created_at": created_at,
    };
  }
  
  @override
    String toString() {
      return 'title: ${this.title}, content: ${this.content}, thumbneil: ${this.thumbneil}, suki_count: ${this.suki_count}, username: ${this.username}, usericon: ${this.usericon}, create_at: ${this.created_at}';
    }
}
