import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sagile_mobile_main/application/create_task_application.dart';
import 'package:sagile_mobile_main/application/edit_task_application.dart';
import 'package:sagile_mobile_main/model/task.dart';
import 'package:sagile_mobile_main/model/user.dart';
import 'package:http/http.dart' as http;

import '../static.dart';

class TaskViewWidget extends StatefulWidget {
  TaskViewWidget({Key? key, required this.tasks, required this.curUser})
      : super(key: key);
  List<Task> tasks;
  final User curUser;

  @override
  _TaskViewWidgetState createState() => _TaskViewWidgetState();
}

class _TaskViewWidgetState extends State<TaskViewWidget>
    with SingleTickerProviderStateMixin {
  static const List<String> status = <String>[
    'To-do',
    'On-going',
    'Done',
  ];

  static List<Tab> tabs = <Tab>[
    Tab(text: status[0]),
    Tab(text: status[1]),
    Tab(text: status[2]),
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
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: const Text('SAgile'),
        leading: IconButton(
            onPressed: () {
              print(widget.curUser.username);
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {
                // TODO: Confirmation dialog (Yes, Yesn't)
                Navigator.of(context).pop();
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
          TabPage(
            tasks: widget.tasks,
            status: status,
            tabNo: 1,
            curUser: widget.curUser,
          ),
          TabPage(
            tasks: widget.tasks,
            status: status,
            tabNo: 2,
            curUser: widget.curUser,
          ),
          TabPage(
            tasks: widget.tasks,
            status: status,
            tabNo: 3,
            curUser: widget.curUser,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => TaskCreateWidget(
                      curUser: widget.curUser,
                      status: status,
                    )),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class TabPage extends StatefulWidget {
  const TabPage(
      {Key? key,
      required this.tasks,
      required this.status,
      required this.tabNo,
      required this.curUser})
      : super(key: key);

  final List<Task> tasks;
  final List<String> status;
  final User curUser;
  final int tabNo;

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  Future _updateCheck(Task task) async {
    try {
      var res = await http.post(
        Uri.parse("${Env.URL_PREFIX}/tasks/complete.php"),
        body: {
          "id": task.id.toString(),
          "completed": task.completed == false ? "0" : "1"
        },
      );
      var result = json.decode(res.body)['result'];

      if (result == false) {
        print("no update");
      } else {
        print("yes update");
      }
      print("received respond!");
    } on Exception catch (e) {
      print(e);
    }
  }

  void _onCheck(Task task) async {
    await _updateCheck(task);
  }

  Future _updateDelete(Task task) async {
    try {
      var res = await http.post(
        Uri.parse("${Env.URL_PREFIX}/tasks/delete.php"),
        body: {
          "id": task.id.toString(),
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

  void _onDelete(Task task) async {
    await _updateDelete(task);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
        itemCount: widget.tasks.length,
        itemBuilder: (context, int i) {
          if (widget.tasks[i].statusId == widget.tabNo) {
            return Card(
              child: ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                title: Text(widget.tasks[i].name),
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(widget.tasks[i].description),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _onDelete(widget.tasks[i]);
                              },
                              child: Text('Delete'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EditTaskWidget(
                                      curTask: widget.tasks[i],
                                      curUser: widget.curUser,
                                      status: widget.status,
                                    ),
                                  ),
                                );
                              },
                              child: Text('Edit'),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
                trailing: Checkbox(
                    value: widget.tasks[i].completed,
                    onChanged: (value) {
                      setState(() {
                        widget.tasks[i].completed = value!;
                      });
                      _onCheck(widget.tasks[i]);
                    }),
              ),
            );
          }
          return Container();
        });
  }
}
