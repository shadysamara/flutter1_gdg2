import 'package:flutter/material.dart';

class CustomCheckBox extends FormField<bool> {
  CustomCheckBox({super.key})
      : super(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (x) {
              if (x != true) {
                return "you have to accept the conditions";
              }
            },
            initialValue: false,
            builder: (FormFieldState<bool> state) {
              return CheckboxListTile(
                  subtitle: state.hasError
                      ? Text(state.errorText ?? '',
                          style: TextStyle(color: Colors.red))
                      : null,
                  title: Text(
                    "Accept the conditions and terms",
                  ),
                  value: state.value,
                  onChanged: state.didChange);
            });
}
