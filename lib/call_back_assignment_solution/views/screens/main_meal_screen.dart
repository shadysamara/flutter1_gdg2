import 'package:flutter/material.dart';
import 'package:flutter_application_1/call_back_assignment_solution/views/screens/all_meals.dart';
import 'package:flutter_application_1/call_back_assignment_solution/views/screens/favourite_meals.dart';
import 'package:flutter_application_1/meals_data.dart';
import 'package:flutter_application_1/meat_class.dart';

class MainMealsFunction extends StatefulWidget {
  @override
  State<MainMealsFunction> createState() => _MainMealsFunctionState();
}

class _MainMealsFunctionState extends State<MainMealsFunction>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  initTabController() {
    tabController = TabController(length: 2, vsync: this);
  }

  List<MealModel> meals = [];
  convertMapToMeals() {
    meals = mealsData.map((e) => MealModel(e)).toList();
  }

  updateMeal(MealModel mealModel) {
    mealModel.isFav = !mealModel.isFav;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    convertMapToMeals();
    initTabController();
  }

  animateFunction(int index) {
    tabController.animateTo(index);
    Navigator.of(context).pop();
  }

  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: CustomDrawer(animateFunction),
      floatingActionButton: FloatingActionButton(onPressed: () {
        pageController.animateToPage(1,
            duration: Duration(seconds: 1), curve: Curves.linear);
      }),
      appBar: AppBar(
        title: Text("Meals App"),
      ),
      body: PageView(controller: pageController, children: [
        AllMealsScreen(meals, updateMeal),
        FavMealsScreen(meals, updateMeal)
      ]),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  Function fun;
  CustomDrawer(this.fun);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Omar"), accountEmail: Text("omar@gmail.com")),
          ListTile(
            onTap: () {
              fun(0);
            },
            title: Text("Go to Home"),
            leading: Icon(Icons.home),
          ),
          ListTile(
            onTap: () {
              fun(1);
            },
            title: Text("Go to Favourite"),
            leading: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
