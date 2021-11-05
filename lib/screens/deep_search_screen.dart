import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeepSearchScreen extends StatelessWidget {
  static const String routeName = "/deep-search";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "بحث",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "بحث",
                hintStyle: TextStyle(),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
