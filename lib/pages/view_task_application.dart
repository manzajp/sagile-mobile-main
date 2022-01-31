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
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: const Text('SAgile'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
                // TODO: Confirmation dialog (Yes, Yesn't)
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Card(
                  child: ExpansionTile(
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    title: Text('Task 3'),
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('something cool'),
                            Text('something cool herre too'),
                          ],
                        ),
                      )
                    ],
                    trailing: Checkbox(
                        value: task2Check,
                        onChanged: (value) {
                          setState(() {
                            task2Check = value!;
                          });
                        }),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/taskCreate');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
