import 'package:flutter/material.dart';

class QuantityComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuantityComponentState();
  }
}

class QuantityComponentState extends State<QuantityComponent> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black54)),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                if (quantity != 10) {
                  quantity++;
                  setState(() {});
                }
              },
              icon: Icon(Icons.add)),
          Text(quantity.toString()),
          IconButton(
              onPressed: () {
                if (quantity != 1) {
                  quantity--;
                  setState(() {});
                }
              },
              icon: Icon(Icons.remove))
        ],
      ),
    );
  }
}
