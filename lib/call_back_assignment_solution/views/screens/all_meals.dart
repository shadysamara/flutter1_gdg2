import 'package:flutter/material.dart';
import 'package:flutter_application_1/call_back_assignment_solution/views/widgets/meals_widget.dart';
import 'package:flutter_application_1/meat_class.dart';

class AllMealsScreen extends StatelessWidget {
  List<MealModel> meals;
  Function fun;
  AllMealsScreen(this.meals, this.fun);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealWidget(meals[index], fun);
        });
  }
}
