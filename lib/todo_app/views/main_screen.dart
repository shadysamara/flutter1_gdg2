import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_app/views/complete_tasks.dart';
import 'package:flutter_application_1/todo_app/views/incomplete_tasks.dart';
import 'package:flutter_application_1/todo_app/views/tasks_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Main Page"),
            bottom: const TabBar(tabs: [
              Tab(
                text: "AllTasks",
                icon: Icon(Icons.list),
              ),
              Tab(
                text: "Complete",
                icon: Icon(Icons.done),
              ),
              Tab(
                text: "InComplete",
                icon: Icon(Icons.cancel),
              ),
            ]),
          ),
          body: TabBarView(children: [
            TasksScreen(updateUi),
            CompeleteTasksScreen(updateUi),
            InCompeleteTasksScreen(updateUi)
          ])),
    );
  }
}
