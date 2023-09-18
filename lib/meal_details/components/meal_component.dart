// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_application_1/meal_details/model/meal_details.dart';

// class MealComponentWidget extends StatefulWidget {
//   MealComponent mealComponent;
//   MealComponentWidget(this.mealComponent);

//   @override
//   State<MealComponentWidget> createState() => _MealComponentWidgetState();
// }

// class _MealComponentWidgetState extends State<MealComponentWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(children: [Text(widget.mealComponent.title),
//       ...widget.mealComponent.items.map((e) {
//         return widget.mealComponent.isMultiSelection?
//         CheckboxListTile(
//           title: Text(e.name),
//           value: false, onChanged: (v){});
//       }).toList()
//       ]),
//     );
//   }
// }
