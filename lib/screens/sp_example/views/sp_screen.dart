import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/custom_textfield.dart';
import 'package:flutter_application_1/screens/sp_example/providers/sp_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<SpProvider>(builder: (context, pr, w) {
      return Scaffold(
        appBar: AppBar(
          title: Text("SpScreen"),
          actions: [
            Switch(
                value: Provider.of<AppController>(context).isDark,
                onChanged: (v) {
                  Provider.of<AppController>(context, listen: false)
                      .toggleIsDark();
                })
          ],
        ),
        body: Column(
          children: [
            Text(
              pr.name,
              style: TextStyle(fontSize: 25.sp),
            ),
            CustomTextfield(
                title: "Name",
                saveFunction: (String? x) {},
                controller: pr.nameController,
                validationFunction: (String? v) {}),
            ElevatedButton(
                onPressed: () {
                  pr.setName();
                },
                child: Text("Add the name"))
          ],
        ),
      );
    });
  }
}
