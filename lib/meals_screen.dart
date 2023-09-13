import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/meal_stateful_widget.dart';
import 'package:flutter_application_1/meals_data.dart';
import 'package:flutter_application_1/meat_class.dart';
import 'package:flutter_application_1/orinetation_screen/landscape_screen.dart';
import 'package:flutter_application_1/orinetation_screen/portrait_sctrrn.dart';

class MealScreen extends StatelessWidget {
  List<MealModel> mealConverter() {
    return mealsData.map((e) => MealModel(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? Scaffold(
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
                            Orientation screenH =
                                MediaQuery.of(context).orientation;
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
                          children: mealConverter()
                              .map((e) => MealWidget(e))
                              .toList())),
                ),
              ],
            ),
          )
        : Scaffold(
            drawer: Drawer(
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
                  const Spacer(),
                  const ListTile(
                      title: Text("Logout"), leading: Icon(Icons.logout)),
                ],
              ),
            ),
            appBar: AppBar(
              title: Text("Meals Screen"),
            ),
            body: SingleChildScrollView(
                child: Column(
                    children: mealConverter()
                        .map((e) => MealStatefulWidget(e))
                        .toList())),
          );
  }
}

/*
- create drawer and add image from the internet to this drawer
- add (home, favourite, news and logout) to the drawer
*/

class MealWidget extends StatelessWidget {
  MealModel mealModel;
  MealWidget(this.mealModel);
  bool isFavourite = false;
  List<String> st1 = ["ahmed", "omar", "ali"];
  List<String> st2 = ["shaker", "hassan"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              mealModel.imageUrl ?? '',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Text(mealModel.name ?? "Not Defined"),
          Text("Contents: "),
          ...mealModel.content?.map((e) {
                return Row(
                  children: [
                    Expanded(child: Text("Name: ${e.name}")),
                    Expanded(child: Text("Price: ${e.price}")),
                  ],
                );
              }).toList() ??
              [],
          GestureDetector(
            onTap: () {
              isFavourite = !isFavourite;
              log(isFavourite.toString());
            },
            child: Icon(
              Icons.favorite,
              size: 40,
              color: isFavourite ? Colors.red : Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
