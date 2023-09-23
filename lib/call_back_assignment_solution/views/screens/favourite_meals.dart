import 'package:flutter/material.dart';
import 'package:flutter_application_1/call_back_assignment_solution/views/widgets/meals_widget.dart';
import 'package:flutter_application_1/meat_class.dart';

class FavMealsScreen extends StatelessWidget {
  List<MealModel> meals;
  Function fun;
  FavMealsScreen(this.meals, this.fun);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: meals.where((element) => element.isFav).length,
        itemBuilder: (context, index) {
          return MealWidget(
              meals.where((element) => element.isFav).toList()[index], fun);
        });
  }
}
