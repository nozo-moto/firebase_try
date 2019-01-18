class User {
  final String id;
  final String name;
  final String icon;

  User(this.id, this.name, this.icon);

  toJson() {
    return {
      "id": id,
      "name": name,
      "icon": icon,
    };
  }
}