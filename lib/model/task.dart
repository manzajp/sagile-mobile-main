class Task {
  int id, statusId, userId;
  String name, description;
  bool completed;
  DateTime date;

  Task({
    this.id = 0,
    required this.statusId,
    required this.userId,
    required this.name,
    required this.description,
    required this.completed,
    required this.date,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      statusId: json['statusId'],
      userId: json['userId'],
      name: json['name'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      completed: json['completed'] == 0 ? false : true,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'statusId': statusId,
        'userId': userId,
        'name': name,
        'description': description,
        'date': date,
        'completed': completed,
      };
}
