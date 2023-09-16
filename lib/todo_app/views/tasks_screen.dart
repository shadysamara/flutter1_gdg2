import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_app/data/dummy_data.dart';
import 'package:flutter_application_1/todo_app/data/task.dart';
import 'package:flutter_application_1/todo_app/views/task_widget.dart';

class TasksScreen extends StatelessWidget {
  Function fun;
  TasksScreen(this.fun);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (c, i) {
          Task task = dataList[i];
          return TaskWidget(task, fun);
        });
  }
}
