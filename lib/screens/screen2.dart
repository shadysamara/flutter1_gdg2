import 'dart:developer';

import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  Future<bool> willPopFunctin(BuildContext context) async {
    bool result = false;
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Alert"),
            content: Text("You will go back from screen2, are you sure?"),
            actions: [
              TextButton(
                  onPressed: () {
                    result = true;
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok")),
              TextButton(
                  onPressed: () {
                    result = false;
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancle"))
            ],
          );
        });
    log(result.toString());
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        return willPopFunctin(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Page2"),
        ),
      ),
    );
  }
}
