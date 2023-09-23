import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_app/controller/todo_provider.dart';
import 'package:flutter_application_1/todo_app/data/task.dart';
import 'package:provider/provider.dart';

class TaskWidget extends StatelessWidget {
  Task task;

  TaskWidget(this.task);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<TodoProvider>(builder: (context, x, y) {
      return Container(
        color: (task.isComplete ?? false) ? Colors.blue : Colors.red,
        margin: EdgeInsets.all(5),
        child: CheckboxListTile(
            title: Text(task.title),
            value: task.isComplete,
            onChanged: (v) {
              x.changeTaskIsComplete(task);
            }),
      );
    });
  }
}
