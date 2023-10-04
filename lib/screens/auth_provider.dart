import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/app_router.dart';
import 'package:flutter_application_1/screens/pages_names.dart';
import 'package:flutter_application_1/screens/screen2.dart';
import 'package:flutter_application_1/screens/sp_example/data/sp_helper.dart';
import 'package:string_validator/string_validator.dart';

class AuthProvider {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String correctUsername = "omar";
  String correctPassword = "123";
  String userNameInput = "";
  String userPasswordInput = "";
  String userEmailInput = "";
  void setUserName(String? name) {
    userNameInput = name ?? '';
  }

  void setUserEmail(String? name) {
    userEmailInput = name ?? '';
  }

  void setUserPassword(String? value) {
    userPasswordInput = value ?? '';
  }

  checkLogin() {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      String userName = userNameController.text;
      String password = passwordController.text;
      if (userName == correctUsername && password == correctPassword) {
        AppRouter.gotoScreen(Screen2());
        // navigation to home page
      } else {
        AppRouter.showCustomDialoug(
            "Error", "Username or password is incorrect");
      }
    }
  }

  String? validateUsername(String? value) {
    if (value?.isEmpty ?? true) {
      return "You have to enter your username";
    } else if (value!.length < 5) {
      return "your should enter 5 characters at least";
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return "* required field";
    } else if (!isEmail(value!)) {
      return "Incorrect email syntax";
    }
  }

  String? validatePassword(String? value) {
    // "omar@123" [A-Z]
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[@!#\$&*~]).{8,}$');
    if (value?.isEmpty ?? true) {
      return "* required field";
    } else if (!regex.hasMatch(value!)) {
      return "Weak Password";
    }
  }
}
