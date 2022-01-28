import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskViewWidget extends StatefulWidget {
  const TaskViewWidget({Key? key}) : super(key: key);
  @override
  _TaskViewWidgetState createState() => _TaskViewWidgetState();
}

class _TaskViewWidgetState extends State<TaskViewWidget>
    with SingleTickerProviderStateMixin {
  bool task1Check = false;
  bool task2Check = false;
  bool task3Check = false;
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'To-do'),
    Tab(text: 'On-going'),
    Tab(text: 'Done'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text('SAgile'),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                elevation: 0,
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              )),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Task 1",
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 16.0, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Checkbox(
                      value: task1Check,
                      onChanged: (value) {
                        setState(() {
                          task1Check = value!;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Task 1",
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 16.0, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Checkbox(
                      value: task1Check,
                      onChanged: (value) {
                        setState(() {
                          task1Check = value!;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Task 1",
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 16.0, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Checkbox(
                      value: task1Check,
                      onChanged: (value) {
                        setState(() {
                          task1Check = value!;
                        });
                      }),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Task 2",
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 16.0, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Checkbox(
                      value: task2Check,
                      onChanged: (value) {
                        setState(() {
                          task2Check = value!;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Task 2",
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 16.0, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Checkbox(
                      value: task2Check,
                      onChanged: (value) {
                        setState(() {
                          task2Check = value!;
                        });
                      }),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Task 1",
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 16.0, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Checkbox(
                      value: task3Check,
                      onChanged: (value) {
                        setState(() {
                          task3Check = value!;
                        });
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
