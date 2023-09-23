import 'package:flutter/material.dart';
import 'package:flutter_application_1/meat_class.dart';

class MealWidget extends StatelessWidget {
  MealModel mealModel;
  Function fun;
  MealWidget(this.mealModel, this.fun);

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
              fun(mealModel);
            },
            child: Icon(
              Icons.favorite,
              size: 40,
              color: mealModel.isFav ? Colors.red : Colors.grey,
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
