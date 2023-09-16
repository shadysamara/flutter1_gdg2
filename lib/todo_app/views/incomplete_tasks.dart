import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_app/data/dummy_data.dart';
import 'package:flutter_application_1/todo_app/data/task.dart';
import 'package:flutter_application_1/todo_app/views/task_widget.dart';

class InCompeleteTasksScreen extends StatelessWidget {
  Function fun;
  InCompeleteTasksScreen(this.fun);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: dataList
            .where((element) => (element.isComplete ?? false) == false)
            .length,
        itemBuilder: (c, i) {
          Task task = dataList
              .where((element) => (element.isComplete ?? false) == false)
              .toList()[i];
          return TaskWidget(task, fun);
        });
  }
}