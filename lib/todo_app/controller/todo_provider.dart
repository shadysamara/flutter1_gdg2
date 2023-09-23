import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_app/data/task.dart';

class TodoProvider extends ChangeNotifier {
  bool fakeVariable = false;
  dummyToggle() {
    fakeVariable = !fakeVariable;
    notifyListeners();
  }

  TodoProvider() {
    fillLists();
  }
  List<Task> dataList = [
    Task(title: "playing football", isComplete: true),
    Task(title: "go to gym", isComplete: false),
    Task(title: "having launch", isComplete: true),
    Task(title: "sleeping", isComplete: false),
    Task(title: "watching tv", isComplete: false),
    Task(title: "reading book", isComplete: true),
  ];
  List<Task> completeTasks = [];
  List<Task> inCompleteTasks = [];
  fillLists() {
    completeTasks = dataList.where((element) => element.isComplete!).toList();
    inCompleteTasks =
        dataList.where((element) => !element.isComplete!).toList();
    notifyListeners();
  }

  changeTaskIsComplete(Task task) {
    task.isComplete = !task.isComplete!;
    fillLists();
  }
}
