import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskCreateWidget extends StatefulWidget {
  const TaskCreateWidget({Key? key}) : super(key: key);
  @override
  _TaskCreateWidgetState createState() => _TaskCreateWidgetState();
}

class _TaskCreateWidgetState extends State<TaskCreateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Task"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
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
                    TextButton(
                        onPressed: buttonPressed,
                        child: Text(
                          "Create a new task!",
                          style: GoogleFonts.robotoCondensed(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ))
                  ]),
            ),
          ]),
    );
  }

  void buttonPressed() {}
}
