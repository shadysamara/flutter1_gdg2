import 'package:flutter/material.dart';
import 'package:flutter_application_1/bnb_lesson/bnb_screen.dart';
import 'package:flutter_application_1/call_back_assignment_solution/views/screens/main_meal_screen.dart';
import 'package:flutter_application_1/meal_details/meal_details.dart';
import 'package:flutter_application_1/meal_details/refactored_meal_details.dart';
import 'package:flutter_application_1/call_back_assignment_solution/views/widgets/meals_widget.dart';
import 'package:flutter_application_1/todo_app/controller/todo_provider.dart';
import 'package:flutter_application_1/todo_app/views/main_screen.dart';
import 'package:flutter_application_1/todo_app/views/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AppController>(create: (context) {
      return AppController();
    }),
    ChangeNotifierProvider<TodoProvider>(create: (context) {
      return TodoProvider();
    }),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<AppController, bool>(builder: (c, v, w) {
      return MaterialApp(
          theme: v ? ThemeData.dark() : ThemeData.light(), home: MainScreen());
    }, selector: (context, pr) {
      return pr.isDark;
    });
  }
}

class MealScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold();
  }
}

class FirstScreen extends StatelessWidget {
  List<Map> data = [
    {
      "image_url":
          "https://images.unsplash.com/photo-1692682905358-c1a0ee81b72e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80",
      "name": "Cold Narure",
      "city": "gaza"
    },
    {
      "image_url":
          "https://images.unsplash.com/photo-1682695799561-033f55f75b25?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80",
      "name": "Hills Narure",
      "city": "Palestine"
    }
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: Column(
            children: data.map((e) {
          return ImageWidget(
            imageUrl: e["image_url"],
            country: e["city"],
            name: e["name"],
          );
        }).toList()));
  }
}

class ImageWidget extends StatelessWidget {
  String imageUrl;
  String country;
  String name;
  ImageWidget({
    Key? key,
    required this.imageUrl,
    required this.country,
    required this.name,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Image.network(imageUrl),
        Text(name),
        Text(country),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

/*
define list of map called meals that contains the following attributes
- image as url
- name as string
- contents as list<Map> {name,price}
convert the map to classes
write the suitaable code to draw the ui



*/
class AppController extends ChangeNotifier {
  bool isDark = true;

  toggleIsDark() {
    isDark = !isDark;
    notifyListeners();
  }
}
