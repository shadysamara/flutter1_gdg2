import 'package:flutter/material.dart';
import 'package:flutter_application_1/meal_details/components/quantity_component.dart';
import 'package:flutter_application_1/meal_details/model/meal_details.dart';

class MealDetailsScreen extends StatefulWidget {
  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  int selectedSizeId = 0;
  int mealPrice = mealDetails.price;
  List<MealComponentItem> addedExtras = [];
  int extrasPrice = 0;
  bool isMale = true;
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
            // Column(
            //   children: [
            //     Radio(
            //       value: true,
            //       groupValue: isMale,
            //       onChanged: (v) {
            //         isMale = true;
            //         setState(() {});
            //       },
            //     ),
            //     Radio(
            //       value: false,
            //       groupValue: isMale,
            //       onChanged: (v) {
            //         isMale = false;
            //         setState(() {});
            //       },
            //     )
            //   ],
            // ),
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 5,
              color: Colors.grey,
            ),
            // size part
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealDetails.mealComponents[0].title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ...mealDetails.mealComponents[0].items.map((e) {
                    return RadioListTile(
                        title: Text(e.name),
                        subtitle: Text(e.price.toString()),
                        value: e.id,
                        groupValue: selectedSizeId,
                        onChanged: (v) {
                          selectedSizeId = e.id;

                          mealPrice = mealDetails.price + e.price;
                          setState(() {});
                        });
                  }).toList()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealDetails.mealComponents[1].title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ...mealDetails.mealComponents[1].items.map((e) {
                    return CheckboxListTile(
                        title: Text(e.name),
                        subtitle: Text(e.price.toString()),
                        value: addedExtras.contains(e),
                        onChanged: (v) {
                          if (v!) {
                            addedExtras.add(e);
                            extrasPrice += e.price;
                          } else {
                            addedExtras.remove(e);
                            extrasPrice -= e.price;
                          }

                          setState(() {});
                        });
                  }).toList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
