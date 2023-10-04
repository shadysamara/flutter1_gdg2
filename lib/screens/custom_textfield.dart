import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth_provider.dart';
import 'package:provider/provider.dart';

typedef String? shadyFunction(String? x);
typedef void SaveFunction(String? x);

class CustomTextfield extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final shadyFunction validationFunction;
  final SaveFunction saveFunction;
  const CustomTextfield({
    Key? key,
    required this.title,
    required this.saveFunction,
    required this.controller,
    required this.validationFunction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: saveFunction,
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
