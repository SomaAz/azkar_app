import 'package:azkar_app2/allah_names.dart';
import 'package:azkar_app2/constance.dart';
import 'package:azkar_app2/widget/app_drawer.dart';
import 'package:azkar_app2/widget/centered_text.dart';
import 'package:azkar_app2/helper/arabic_number_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AllahNamesScreen extends StatelessWidget {
  static const String routeName = "/allah-names";
  @override
  Widget build(BuildContext context) {
    final List<String> allahNamesList = allahNamesInString.split(".");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "أسماء الله الحسنى",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        itemBuilder: (ctx, index) {
          if (allahNamesList[index].split(":").length > 1) {
            return Card(
              elevation: 0,
              color: primarySwatch.shade50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CenteredText(
                      "${index.convertToArabicNumber()}.${allahNamesList[index].split(":")[0].replaceAll("\n", "")}",
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: "amiri",
                    ),
                    CenteredText(
                      allahNamesList[index].split(":")[1].replaceAll("\n", ""),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "amiri",
                    ),
                  ],
                ),
              ),
            );
          } else {
            print(allahNamesList[index]);
            return SizedBox();
          }
        },
        itemCount: allahNamesList.length,
      ),
      drawer: AppDrawer(),
    );
  }
}//حسد
