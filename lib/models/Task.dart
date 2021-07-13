class Task {

  final int id;

  final String name;

  final String description;

  final String author;

  String status;


  Task({
    required this.id,
    required this.name,
    required this.description,
    required this.author,
    required this.status,
  });

  static Task fromMap(dynamic map) => Task(
    name: map["name"],
    id: map["id"],
    description: map["description"],
    author: map["author"],
    status: map["status"]
  );
}