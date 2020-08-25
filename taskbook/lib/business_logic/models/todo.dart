class Todo {
  String id;
  String title;
  String details;

  Todo({
    this.id,
    this.title,
    this.details,
  });

  factory Todo.fromJson(Map<String, dynamic> json, String id) => Todo(
        id: id,
        title: json["title"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "details": details,
      };
}
