import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sagile_mobile_main/model/task.dart';
import '../static.dart';

class EditTaskWidget extends StatefulWidget {
  final Task task;
  const EditTaskWidget({Key? key, required this.task}) : super(key: key);
  @override
  _EditTaskWidgetState createState() => _EditTaskWidgetState();
}

class _EditTaskWidgetState extends State<EditTaskWidget> {

  bool notifyUpdate = false;
  DateTime taskDate = DateUtils.dateOnly(DateTime.now());
  final formKey = GlobalKey<FormState>();
  List <String> status = ['To-do', 'On-going', 'Done'];
  late String stringDropdownValue = status.first;
  int dropdownValue = 1;

  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescController = TextEditingController();

  Future _editTask() async{
    try {
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
    } on Exception catch (e) {
      // TODO
      print('server not found');
    }
  }

  void _onEdit(context) async {
    await _editTask();
  }

  @override
  Widget build(BuildContext context) {
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
                                validator: (taskName) {
                                if (taskName!.isEmpty) {
                                  return 'Please enter a task name!';
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
                        Container(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DropdownButton<String>(
                                value: stringDropdownValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    stringDropdownValue = newValue!;
                                    switch(stringDropdownValue){
                                      case 'To-do':
                                        dropdownValue = 1;
                                        break;
                                      case 'On-going':
                                        dropdownValue = 2;
                                        break;
                                      case 'Done':
                                        dropdownValue = 3;
                                        break;
                                    }
                                  });
                                },
                                items: status.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
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
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal),
                              ),
                              TextButton(
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
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                _onEdit(context);
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
