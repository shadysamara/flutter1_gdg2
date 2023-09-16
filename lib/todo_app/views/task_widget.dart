import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_app/data/task.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  Function fun;
  TaskWidget(this.task, this.fun);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: (task.isComplete ?? false) ? Colors.blue : Colors.red,
      margin: EdgeInsets.all(5),
      child: CheckboxListTile(
          title: Text(task.title),
          value: task.isComplete,
          onChanged: (v) {
            task.isComplete = !(task.isComplete ?? false);

            fun();
          }),
    );
  }
}
