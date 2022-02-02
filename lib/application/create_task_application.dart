import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sagile_mobile_main/application/view_task_application.dart';
import 'package:sagile_mobile_main/model/task.dart';
import 'package:sagile_mobile_main/model/user.dart';

import '../static.dart';

class TaskCreateWidget extends StatefulWidget {
  const TaskCreateWidget(
      {Key? key, required this.curUser, required this.status})
      : super(key: key);
  final User curUser;
  final List<String> status;

  @override
  _TaskCreateWidgetState createState() => _TaskCreateWidgetState();
}

class _TaskCreateWidgetState extends State<TaskCreateWidget> {
  Future _createTask(Task task) async {
    try {
      var res = await http.post(
        Uri.parse("${Env.URL_PREFIX}/tasks/create.php"),
        body: {
          'statusId': task.statusId.toString(),
          'userId': task.userId.toString(),
          'name': task.name,
          'description': task.description,
          'completed': task.completed == false ? "0" : "1",
          'date': task.date.toString(),
        },
      );
      var result = json.decode(res.body)['result'];

      if (result == false) {
        print("no update");
      } else {
        print("yes update");
        res = await http.post(
          Uri.parse("${Env.URL_PREFIX}/tasks/list.php"),
        );
        var result = json.decode(res.body)['result'];
        List<Task> tasks =
            (result as List).map((data) => Task.fromJson(data)).toList();

        Navigator.of(context).popUntil(ModalRoute.withName('/login'));
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                TaskViewWidget(tasks: tasks, curUser: widget.curUser),
          ),
        );
      }
      print("received respond!");
    } on Exception catch (e) {
      print(e);
    }
  }

  void _onCreate(Task task) async {
    await _createTask(task);
  }

  DateTime taskDate = DateTime.now();
  late String stringDropdownValue = widget.status.first;
  int dropdownValue = 1;
  final formKey = GlobalKey<FormState>();
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Task"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            elevation: 15,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name of the task:",
                            style: GoogleFonts.robotoCondensed(
                                fontSize: 16.0, fontWeight: FontWeight.normal),
                          ),
                          TextFormField(
                            controller: taskNameController,
                            style: GoogleFonts.robotoCondensed(
                                fontSize: 16.0, fontWeight: FontWeight.normal),
                            decoration: const InputDecoration(
                              hintText: 'e.g. Sprint Planning Week 1',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please fill in the the title';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description of the task:",
                            style: GoogleFonts.robotoCondensed(
                                fontSize: 16.0, fontWeight: FontWeight.normal),
                          ),
                          TextFormField(
                            controller: taskDescController,
                            maxLines: 3,
                            style: GoogleFonts.robotoCondensed(
                                fontSize: 16.0, fontWeight: FontWeight.normal),
                            decoration: const InputDecoration(
                              hintText:
                                  'e.g. Discuss on Project Background, Project Backlogs and Sprint Backlog 1',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Date:",
                            style: GoogleFonts.robotoCondensed(
                                fontSize: 16.0, fontWeight: FontWeight.normal),
                          ),
                          TextButton(
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: taskDate, // Refer step 1
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2025),
                              );
                              if (picked != null && picked != taskDate) {
                                setState(() {
                                  taskDate = picked;
                                });
                              }
                            },
                            child: Text("${taskDate.day}/"
                                "${taskDate.month}"
                                "/${taskDate.year}"),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Task task = Task(
                          statusId: dropdownValue,
                          userId: widget.curUser.id,
                          name: taskNameController.text,
                          description: taskDescController.text == ""
                              ? ""
                              : taskDescController.text,
                          completed: false,
                          date: taskDate,
                        );
                        if (formKey.currentState!.validate()) {
                          print(task.date);
                          _onCreate(task);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Text(
                          "Create a new task!",
                          style: GoogleFonts.robotoCondensed(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void buttonPressed() {}
}
