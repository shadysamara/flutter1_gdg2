import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_app/controller/todo_provider.dart';
import 'package:flutter_application_1/todo_app/data/task.dart';
import 'package:flutter_application_1/todo_app/views/task_widget.dart';
import 'package:provider/provider.dart';

class InCompeleteTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<TodoProvider>(builder: (context, pr, w) {
      return ListView.builder(
          itemCount: pr.inCompleteTasks.length,
          itemBuilder: (c, i) {
            return TaskWidget(pr.inCompleteTasks[i]);
          });
    });
  }
}
