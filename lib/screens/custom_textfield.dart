import 'package:flutter/material.dart';

typedef String? shadyFunction(String? x);

class CustomTextfield extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final shadyFunction validationFunction;
  const CustomTextfield({
    Key? key,
    required this.title,
    required this.controller,
    required this.validationFunction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        TextFormField(
          validator: validationFunction,
          controller: controller,
          decoration: InputDecoration(
              hintText: title,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
