class Task {
  int id, statusId, userId;
<<<<<<< Updated upstream
  String taskName, taskDescription;
  bool completeCheck;
=======
  String name, description;
  bool completed;
>>>>>>> Stashed changes
  DateTime date;

  Task({
    this.id = 0,
    required this.statusId,
    required this.userId,
<<<<<<< Updated upstream
    required this.taskName,
    required this.taskDescription,
    required this.completeCheck,
=======
    required this.name,
    required this.description,
    required this.completed,
>>>>>>> Stashed changes
    required this.date,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      statusId: json['statusId'],
      userId: json['userId'],
<<<<<<< Updated upstream
      taskName: json['taskName'],
      taskDescription: json['taskDescription'],
      completeCheck: json['completeCheck'],
      date: json['date'],
=======
      name: json['name'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      completed: json['completed'] == 0 ? false : true,
>>>>>>> Stashed changes
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'statusId': statusId,
        'userId': userId,
<<<<<<< Updated upstream
        'taskName': taskName,
        'taskDescription': taskDescription,
        'completeCheck': completeCheck,
        'date': date,
=======
        'name': name,
        'description': description,
        'date': date,
        'completed': completed,
>>>>>>> Stashed changes
      };
}
