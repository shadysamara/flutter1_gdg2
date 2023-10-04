import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/sp_example/data/sp_helper.dart';

class SpProvider extends ChangeNotifier {
  SpProvider() {
    getName();
  }
  String name = "";
  TextEditingController nameController = TextEditingController();
  getName() {
    name = SpHelper.spHelper.getName() ?? "Not Defined";
    notifyListeners();
  }

  setName() async {
    await SpHelper.spHelper.saveName(nameController.text);
    getName();
  }
}
