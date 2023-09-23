import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:provider/provider.dart';

class BnbScreen extends StatefulWidget {
  @override
  State<BnbScreen> createState() => _BnbScreenState();
}

class _BnbScreenState extends State<BnbScreen> {
  PageController pageController = PageController();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
              value: Provider.of<AppController>(context).isDark,
              onChanged: (v) {
                Provider.of<AppController>(context, listen: false)
                    .toggleIsDark();
              })
        ],
      ),
      body: Container(
        child: Column(
          children: [],
        ),
        color: Colors.red,
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 2,
      ),
      /*PageView(
        onPageChanged: (newPageIndex) {
          selectedIndex = newPageIndex;
          setState(() {});
        },
        controller: pageController,
        children: [
          Center(
            child: Text(
              "Home Page",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              "Favourite Page",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      */
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (i) {
          selectedIndex = i;
          setState(() {});

          pageController.animateToPage(i,
              duration: Duration(milliseconds: 100), curve: Curves.linear);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourite"),
        ],
      ),
    );
  }
}
