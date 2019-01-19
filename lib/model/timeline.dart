class TimeLine {
  final String content;
  final int suki_count;
  final String thumbneil;
  final String title;
  final String usericon;
  final String username;
  final String created_at;

  const TimeLine(
    this.title,
    this.content,
    this.thumbneil,
    this.suki_count,
    this.username,
    this.usericon,
    this.created_at,
  );

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
}