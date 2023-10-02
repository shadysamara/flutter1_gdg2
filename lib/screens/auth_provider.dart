import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/app_router.dart';
import 'package:flutter_application_1/screens/pages_names.dart';
import 'package:flutter_application_1/screens/screen2.dart';

class AuthProvider {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String correctUsername = "omar";
  String correctPassword = "123";
  checkLogin() {
    String userName = userNameController.text;
    String password = passwordController.text;
    if (userName == correctUsername && password == correctPassword) {
      AppRouter.gotoScreen(Screen2());
      // navigation to home page
    } else {
      AppRouter.showCustomDialoug("Error", "Username or password is incorrect");
    }
  }
}
