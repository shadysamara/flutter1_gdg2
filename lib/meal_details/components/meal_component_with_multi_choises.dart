import 'package:flutter/material.dart';
import 'package:flutter_application_1/meal_details/model/meal_details.dart';

class MealComponentWithMultiChoices extends StatelessWidget {
  MealComponent mealComponent;
  MealComponentWithMultiChoices(this.mealComponent);
  List<MealComponentItem> items = [];
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(mealComponent.items[index].name),
                      Checkbox(
                          value: items.contains(mealComponent.items[index]),
                          onChanged: (v) {
                            if (v!) {
                              items.add(mealComponent.items[index]);
                            } else {
                              items.remove(mealComponent.items[index]);
                            }
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
