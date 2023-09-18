import 'package:flutter/material.dart';
import 'package:flutter_application_1/meal_details/components/meal_component_with_multi_choises.dart';
import 'package:flutter_application_1/meal_details/components/meal_component_with_one_choise.dart';
import 'package:flutter_application_1/meal_details/components/quantity_component.dart';
import 'package:flutter_application_1/meal_details/model/meal_details.dart';

class RefactoredMealDetailsScreen extends StatefulWidget {
  @override
  State<RefactoredMealDetailsScreen> createState() =>
      RefactoredMealDetailsScreenState();
}

class RefactoredMealDetailsScreenState
    extends State<RefactoredMealDetailsScreen> {
  int mealPrice = mealDetails.price;
  int selectedId = 0;
  int extrasPrice = 0;
  updatePrice(int newPrice, int index) {
    mealPrice = mealDetails.price + newPrice;
    selectedId = index;
    setState(() {});
  }

  addOrreducePrice(int price, bool isIncrease) {
    if (isIncrease) {
      extrasPrice += price;
    } else {
      extrasPrice -= price;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(25))),
              child: Image.network(
                mealDetails.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // // quantity with price
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    mealDetails.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    mealDetails.description,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${mealPrice + extrasPrice} NIS",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      QuantityComponent()
                    ],
                  ),
                ],
              ),
            ),
            ...mealDetails.mealComponents.map((e) {
              if (e.isMultiSelection) {
                return MealComponentWithMultiChoices(e);
              } else {
                return MealComponentWithOneChoice(e, updatePrice, selectedId);
              }
            }).toList()
          ],
        ),
      ),
    );
  }
}
