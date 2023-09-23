import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/todo_app/views/complete_tasks.dart';
import 'package:flutter_application_1/todo_app/views/incomplete_tasks.dart';
import 'package:flutter_application_1/todo_app/views/tasks_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            actions: [
              Selector<AppController, bool>(builder: (context, value, w) {
                return Switch(
                    value: value,
                    onChanged: (v) {
                      Provider.of<AppController>(context, listen: false)
                          .toggleIsDark();
                    });
              }, selector: (context, provider) {
                return provider.isDark;
              })
            ],
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
            TasksScreen(),
            CompeleteTasksScreen(),
            InCompeleteTasksScreen()
          ])),
    );
  }
}
