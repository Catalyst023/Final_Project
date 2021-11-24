Map<dynamic, dynamic> convertTodoListToMap(List<Todo> todos) {
  Map<dynamic, dynamic> map = {};
  for (var i = 0; i < todos.length; i++) {
    map.addAll({'$i': todos[i].toJson()});
  }
  return map;
}

List<Todo> convertMapToTodoList(Map<dynamic, dynamic> map) {
  List<Todo> todos = [];
  for (var i = 0; i < map.length; i++) {
    todos.add(Todo.fromJson(map['$i']));
  }
  return todos;
}

class Todo {
  final String title;
  final String title1;

  bool done;
  final DateTime created;

  Todo({
    required this.title,
    required this.title1,
    this.done = false,
    required this.created,
  });

  Map<String, Object?> toJson() => {
        'title': title,
        'title1': title1,
        'done': done ? 1 : 0,
        'created': created.millisecondsSinceEpoch,
      };

  static Todo fromJson(Map<dynamic, dynamic>? json) => Todo(
        title1: json!['title1'] as String,
        title: json['title'] as String,
        done: json['done'] == 1 ? true : false,
        created: DateTime.fromMillisecondsSinceEpoch(
            (json['created'] as double).toInt()),
      );

  @override
  bool operator ==(covariant Todo todo) {
    return (this.title.toUpperCase().compareTo(todo.title.toUpperCase()) == 0 &&
        this.title1.toUpperCase().compareTo(todo.title1.toUpperCase()) == 0);
  }

  @override
  int get hashCode {
    return title.hashCode + title1.hashCode;
  }
}
