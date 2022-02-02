import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
<<<<<<< Updated upstream:lib/pages/edit_task_application.dart
import 'package:sagile_mobile_main/model/task.dart';
import '../static.dart';

class EditTaskWidget extends StatefulWidget {
  final Task task;
  const EditTaskWidget({Key? key, required this.task}) : super(key: key);
=======
import 'package:sagile_mobile_main/application/view_task_application.dart';
import 'package:sagile_mobile_main/model/task.dart';
import 'package:sagile_mobile_main/model/user.dart';
import '../static.dart';

class EditTaskWidget extends StatefulWidget {
  const EditTaskWidget(
      {Key? key,
      required this.curUser,
      required this.curTask,
      required this.status})
      : super(key: key);
  final User curUser;
  final List<String> status;
  final Task curTask;

>>>>>>> Stashed changes:lib/application/edit_task_application.dart
  @override
  _EditTaskWidgetState createState() => _EditTaskWidgetState();
}

class _EditTaskWidgetState extends State<EditTaskWidget> {
  Future _editTask(Task task) async {
    try {
<<<<<<< Updated upstream:lib/pages/edit_task_application.dart
      await http.post(
        Uri.parse("${Env.URL_PREFIX}/task/update.php"),
        body: {
          "id": widget.task.id,
          "taskName": taskNameController.text,
          "taskDescription": taskDescController.text,
          "statusId": dropdownValue,
          "date": taskDate,
        },
      );
      print('task updated');
        Navigator.pop(context);
=======
      var res = await http.post(
        Uri.parse("${Env.URL_PREFIX}/tasks/update.php"),
        body: {
          'id': widget.curTask.id.toString(),
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
>>>>>>> Stashed changes:lib/application/edit_task_application.dart
    } on Exception catch (e) {
      print(e);
    }
  }

  void _onEdit(Task task) async {
    await _editTask(task);
  }

  DateTime taskDate = DateUtils.dateOnly(DateTime.now());
  final formKey = GlobalKey<FormState>();
  late List<String> status;
  int dropdownValue = 1;

  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescController = TextEditingController();

  @override
  initState() {
    super.initState();
    taskNameController = TextEditingController(text: widget.curTask.name);
    taskDescController =
        TextEditingController(text: widget.curTask.description);
    status = widget.status;
    // dropdownValue = widget.curTask.statusId;
    // switch (dropdownValue) {
    //   case 1:
    //     stringDropdownValue = status[0];
    //     break;
    //   case 2:
    //     stringDropdownValue = status[1];
    //     break;
    //   case 3:
    //     stringDropdownValue = status[2];
    //     break;
    // }

    taskDate = widget.curTask.date;
  }

  @override
  Widget build(BuildContext context) {
    // String stringDropdownValue = ;
    // int dropdownValue = 1;
    // dropdownValue = widget.curTask.statusId;
    // switch (dropdownValue) {
    //   case 1:
    //     stringDropdownValue = status[0];
    //     break;
    //   case 2:
    //     stringDropdownValue = status[1];
    //     break;
    //   case 3:
    //     stringDropdownValue = status[2];
    //     break;
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Task"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
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
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal),
                              ),
                              TextFormField(
                                controller: taskNameController,
                                initialValue: "#",
                                style: GoogleFonts.robotoCondensed(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal),
                                decoration: const InputDecoration(
                                  hintText: 'e.g. Sprint Planning Week 1',
                                ),
<<<<<<< Updated upstream:lib/pages/edit_task_application.dart
                                validator: (taskName) {
                                if (taskName!.isEmpty) {
                                  return 'Please enter a task name!';
                                }
                                return null;
                              },
=======
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please fill in the the title';
                                  }
                                  return null;
                                },
>>>>>>> Stashed changes:lib/application/edit_task_application.dart
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
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal),
                              ),
                              TextFormField(
                                controller: taskDescController,
                                initialValue: "#",
                                maxLines: 3,
                                style: GoogleFonts.robotoCondensed(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal),
                                decoration: const InputDecoration(
                                  hintText:
                                      'e.g. Discuss on Project Background, Project Backlogs and Sprint Backlog 1',
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   padding: const EdgeInsets.only(bottom: 15),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       DropdownButton<String>(
                        //         value: stringDropdownValue,
                        //         onChanged: (String? newValue) {
                        //           setState(() {
                        //             stringDropdownValue = newValue!;
                        //             switch (stringDropdownValue) {
                        //               case 'To-do':
                        //                 dropdownValue = 1;
                        //                 break;
                        //               case 'On-going':
                        //                 dropdownValue = 2;
                        //                 break;
                        //               case 'Done':
                        //                 dropdownValue = 3;
                        //                 break;
                        //             }
                        //           });
                        //         },
                        //         items: status.map<DropdownMenuItem<String>>(
                        //             (String value) {
                        //           return DropdownMenuItem<String>(
                        //             value: value,
                        //             child: Text(value),
                        //           );
                        //         }).toList(),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Date:",
                                style: GoogleFonts.robotoCondensed(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal),
                              ),
                              TextButton(
<<<<<<< Updated upstream:lib/pages/edit_task_application.dart
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: taskDate,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2025),
                                    );
                                  },
                                  child: Text("${taskDate.day}/"
                                      "${taskDate.month}"
                                      "/${taskDate.year}")),
=======
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
>>>>>>> Stashed changes:lib/application/edit_task_application.dart
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                _onEdit(Task(
                                    statusId: dropdownValue,
                                    userId: widget.curUser.id,
                                    name: taskNameController.text,
                                    description: taskDescController.text,
                                    completed: false,
                                    date: taskDate));
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              child: Text(
                                "Create a new task!",
                                style: GoogleFonts.robotoCondensed(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ))
                      ]),
                ),
              ),
            ),
          ]),
    );
  }

  void buttonPressed() {}
}
