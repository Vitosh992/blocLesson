class ToDo {
  int id;
  int userId;
  String title;
  bool completed;

  ToDo({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}