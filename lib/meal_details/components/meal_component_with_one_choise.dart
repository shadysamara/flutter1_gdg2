import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/meal_details/model/meal_details.dart';

class MealComponentWithOneChoice extends StatelessWidget {
  MealComponent mealComponent;
  int selectedIndex;
  Function fun;
  MealComponentWithOneChoice(this.mealComponent, this.fun, this.selectedIndex);
  int x = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mealComponent.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: mealComponent.items.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text(mealComponent.items[index].name),
                      const Spacer(),
                      Text(mealComponent.items[index].price.toString()),
                      Radio(
                          value: mealComponent.items[index].id,
                          groupValue: selectedIndex,
                          onChanged: (v) {
                            fun(mealComponent.items[index].price,
                                mealComponent.items[index].id);
                          })
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
