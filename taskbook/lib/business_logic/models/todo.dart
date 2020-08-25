class Todo {
  String id;
  String title;
  String details;
  bool isComplete;

  Todo({
    this.id,
    this.title,
    this.details,
    this.isComplete = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json, String id) => Todo(
        id: id,
        title: json["title"],
        details: json["details"],
        isComplete: json["isComplete"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "details": details,
        "isComplete": isComplete,
      };
}
