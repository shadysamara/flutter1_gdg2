import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth_provider.dart';
import 'package:flutter_application_1/screens/custom_textfield.dart';
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
                CustomTextfield(
                    title: "UserName",
                    controller: pr.userNameController,
                    validationFunction: pr.validateUsername),
                CustomTextfield(
                    title: "Email",
                    controller: pr.emailController,
                    validationFunction: pr.validateEmail),
                CustomTextfield(
                    title: "Password",
                    controller: pr.passwordController,
                    validationFunction: pr.validatePassword),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      pr.checkLogin();
                    },
                    child: Text("Login"))
              ],
            ),
          ),
        );
      }),
    );
  }
}
