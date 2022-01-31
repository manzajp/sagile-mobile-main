import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskCreateWidget extends StatefulWidget {
  const TaskCreateWidget({Key? key}) : super(key: key);
  @override
  _TaskCreateWidgetState createState() => _TaskCreateWidgetState();
}

class _TaskCreateWidgetState extends State<TaskCreateWidget> {
  bool notifyUpdate = false;
  DateTime taskDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Task"),
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
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Form(
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
                          TextField(
                            style: GoogleFonts.robotoCondensed(
                                fontSize: 16.0, fontWeight: FontWeight.normal),
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
                                fontSize: 16.0, fontWeight: FontWeight.normal),
                          ),
                          TextField(
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
                                  "/${taskDate.year}")),
                        ],
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.only(bottom: 15),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Text(
                    //         "Notify all members on changes?",
                    //         style: GoogleFonts.robotoCondensed(
                    //             fontSize: 16.0,
                    //             fontWeight: FontWeight.normal),
                    //       ),
                    //       Checkbox(
                    //           value: notifyUpdate,
                    //           onChanged: (value) {
                    //             setState(() {
                    //               notifyUpdate = value!;
                    //             });
                    //           }),
                    //     ],
                    //   ),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
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
