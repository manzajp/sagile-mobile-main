class Task{
  int id, statusId;
  String taskName;
  bool completeCheck;

  Task({
    required this.id,
    required this.statusId,
    required this.taskName,
    required this.completeCheck,
  });

  factory Task.fromJson(Map<String, dynamic> json){
    return Task(
      id: json['id'],
      statusId: json['statusId'],
      taskName: json['taskName'],
      completeCheck: json['completeCheck'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id':id,
        'statudId':statusId,
        'taskName': taskName,
        'completeCheck':completeCheck,
      };
}