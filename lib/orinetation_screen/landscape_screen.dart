import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/meals_data.dart';
import 'package:flutter_application_1/meals_screen.dart';
import 'package:flutter_application_1/meat_class.dart';

class LandScapeScreen extends StatelessWidget {
  List<MealModel> mealConverter() {
    return mealsData.map((e) => MealModel(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meals Screen"),
      ),
      body: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1516684732162-798a0062be99?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2592&q=80")),
                      accountName: const Text("Omar Saleh"),
                      accountEmail: const Text("Omar@gmail.com")),
                  ListTile(
                    title: Text("Home Page"),
                    leading: Icon(Icons.home),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Orientation screenH = MediaQuery.of(context).orientation;
                      log(screenH.toString());
                    },
                  ),
                  const ListTile(
                    title: Text("Favourite Page"),
                    leading: Icon(Icons.favorite),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const ListTile(
                    title: Text("News Page"),
                    leading: Icon(Icons.list),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const ListTile(
                      title: Text("Logout"), leading: Icon(Icons.logout)),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
                    children:
                        mealConverter().map((e) => MealWidget(e)).toList())),
          ),
        ],
      ),
    );
  }
}
