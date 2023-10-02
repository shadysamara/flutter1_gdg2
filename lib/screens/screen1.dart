import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth_provider.dart';
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
          child: Column(
            children: [
              TextField(
                controller: pr.userNameController,
                decoration: InputDecoration(
                    hintText: "UserName",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: pr.passwordController,
                decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    pr.checkLogin();
                  },
                  child: Text("Login"))
            ],
          ),
        );
      }),
    );
  }
}
