class Task {
  int id, statusId, userId;
  String taskName, taskDescription;
  bool completeCheck;
  DateTime date;

  Task({
    required this.id,
    required this.statusId,
    required this.userId,
    required this.taskName,
    required this.taskDescription,
    required this.completeCheck,
    required this.date,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      statusId: json['statusId'],
      userId: json['userId'],
      taskName: json['taskName'],
      taskDescription: json['taskDescription'],
      completeCheck: json['completeCheck'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'statusId': statusId,
        'userId': userId,
        'taskName': taskName,
        'taskDescription': taskDescription,
        'completeCheck': completeCheck,
        'date': date,
      };
}
