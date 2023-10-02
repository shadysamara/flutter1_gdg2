import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navKey = GlobalKey();
  static gotoScreen(Widget widget) {
    navKey.currentState!.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  static Future goToScreenUsingRouteName(String name) {
    return navKey.currentState!.pushNamed(name);
  }

  static Future gotoScreenWithReplacement(Widget widget) {
    return navKey.currentState!
        .pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  static gobackFromScreen(dynamic args) {
    navKey.currentState!.pop(args);
  }

  static showCustomDialoug(String title, String content) {
    showDialog(
        context: navKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
          );
        });
  }
}
