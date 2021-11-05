import 'package:azkar_app2/constance.dart';
import 'package:azkar_app2/screens/allah_names_screen.dart';
import 'package:azkar_app2/screens/deep_search_screen.dart';
import 'package:azkar_app2/screens/azkar_screen.dart';
import 'package:azkar_app2/screens/zekr_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(AzkarApp());
}

// ignore: use_key_in_widget_constructors
class AzkarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (ctx, child) {
        return Directionality(
            textDirection: TextDirection.rtl,
            child: AnnotatedRegion<SystemUiOverlayStyle>(
              child: child!,
              value: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: Colors.white,
                systemNavigationBarDividerColor: Colors.grey,
                systemNavigationBarIconBrightness: Brightness.dark,
              ),
            ));
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primarySwatch,
        scaffoldBackgroundColor: Colors.grey[200],
        fontFamily: "almarai",
      ),
      home: AzkarScreen(),
      routes: {
        ZekrScreen.routeName: (_) => ZekrScreen(),
        AllahNamesScreen.routeName: (_) => AllahNamesScreen(),
      },
    );
  }
}
