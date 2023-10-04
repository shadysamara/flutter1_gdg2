import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth_provider.dart';
import 'package:flutter_application_1/screens/custom_checkbox.dart';
import 'package:flutter_application_1/screens/custom_textfield.dart';
import 'package:flutter_application_1/screens/sp_example/data/sp_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Page1"),
      ),
      body: Consumer<AuthProvider>(builder: (context, pr, child) {
        return Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: pr.formKey,
            child: Column(
              children: [
                Container(
                  height: 50.h,
                  width: 80.w,
                  color: Colors.red,
                ),
                CustomTextfield(
                    saveFunction: pr.setUserName,
                    title: "UserName",
                    controller: pr.userNameController,
                    validationFunction: pr.validateUsername),
                CustomTextfield(
                    saveFunction: pr.setUserEmail,
                    title: "Email",
                    controller: pr.emailController,
                    validationFunction: pr.validateEmail),
                CustomTextfield(
                    saveFunction: pr.setUserPassword,
                    title: "Password",
                    controller: pr.passwordController,
                    validationFunction: pr.validatePassword),
                const Spacer(),
                CustomCheckBox(),
                ElevatedButton(
                    onPressed: () {
                      pr.checkLogin();
                    },
                    child: Text("Login")),
                ElevatedButton(
                    onPressed: () async {
                      await SpHelper.spHelper.initSp();
                      log(SpHelper.spHelper.getName() ?? "not defined");
                      // SpHelper.spHelper.deleteName();
                    },
                    child: Text("test saved values"))
              ],
            ),
          ),
        );
      }),
    );
  }
}
