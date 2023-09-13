import 'package:flutter/material.dart';
import 'package:flutter_application_1/meals_screen.dart';

void main() {
  runApp(MaterialApp(home: MealScreen()));
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