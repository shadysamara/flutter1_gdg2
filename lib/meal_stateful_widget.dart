import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/meat_class.dart';

class MealStatefulWidget extends StatefulWidget {
  MealModel mealModel;
  MealStatefulWidget(this.mealModel);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MealStatefulWidgetState();
  }
}

class MealStatefulWidgetState extends State<MealStatefulWidget> {
  bool isFavourite = false;
  List<String> comments = [];
  bool isCommented = false;
  TextEditingController controller = TextEditingController();
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
              widget.mealModel.imageUrl ?? '',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Text(widget.mealModel.name ?? "Not Defined"),
          Text("Contents: "),
          ...widget.mealModel.content?.map((e) {
                return Row(
                  children: [
                    Expanded(child: Text("Name: ${e.name}")),
                    Expanded(child: Text("Price: ${e.price}")),
                  ],
                );
              }).toList() ??
              [],
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  isFavourite = !isFavourite;
                  setState(() {});
                },
                child: Icon(
                  Icons.favorite,
                  size: 40,
                  color: isFavourite ? Colors.red : Colors.grey,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  isCommented = !isCommented;
                  setState(() {});
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.comment,
                      size: 40,
                      color: isFavourite ? Colors.red : Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(comments.length.toString())
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: isCommented,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: this.controller,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      comments.add(this.controller.text);
                      controller.clear();
                      isCommented = false;
                      setState(() {});
                    },
                    icon: Icon(Icons.send))
              ],
            ),
          ),
          ...comments.map((e) {
            return Text(e);
          }).toList(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
