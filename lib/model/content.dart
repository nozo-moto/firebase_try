class Content {
  final String content;
  final String title;
  final String url;
  final String thumbneil;

  Content(this.title, this.content, this.url, this.thumbneil);

  toJson() {
    return {
      "title": title,
      "content": content,
      "url": url,
      "thumbneil": thumbneil,
    };
  }
}