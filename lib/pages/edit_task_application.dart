import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../static.dart';

class EditTaskWidget extends StatefulWidget {
  const EditTaskWidget({Key? key}) : super(key: key);
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
      final res = await http.post(
        Uri.parse("${Env.URL_PREFIX}/task/details.php"),
        body: {
          "taskName": taskNameController.text,
          "taskDesc": taskDescController.text,
        },
      );
      var result = json.decode(res.body)['result'];

      if(result == true){
        setState((){
          formKey.currentState!.validate();
        });

        await http.post(
          Uri.parse("${Env.URL_PREFIX}/task/create.php"),
          body: {
            "taskName": taskNameController.text,
            "taskDesc": taskDescController.text,
          },
        );
        print('task updated');
        Navigator.pop(context);
      }else{
        //
      }
      print("received respond!");
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
                              TextFormField(initialValue: "#"),
                              TextField(
                                controller: taskNameController,
                                style: GoogleFonts.robotoCondensed(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal),
                                decoration: const InputDecoration(
                                  hintText: 'e.g. Sprint Planning Week 1',
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
                              Text(
                                "Description of the task:",
                                style: GoogleFonts.robotoCondensed(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal),
                              ),
                              TextFormField(initialValue: "#"),
                              TextField(
                                controller: taskDescController,
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
                                      initialDate: DateTime.now(),
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
