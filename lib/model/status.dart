class Status {
  int id;
  String statusName;

  Status({required this.id, required this.statusName});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json['id'],
      statusName: json['statusName'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'statusName': statusName,
      };
}
