import 'package:notelike_app/model/user.dart';
import 'package:notelike_app/model/content.dart';

class TimeLine {
  final User user;
  final Content content;

  const TimeLine(
    this.content,
    this.user
  );

  toJson() {
    return {
      "content": content.toJson(),
      "user": user.toJson(),
    };
  }
}