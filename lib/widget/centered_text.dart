import 'package:flutter/material.dart';

class CenteredText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final double? height;
  final Color color;
  final String? fontFamily;
  const CenteredText(
    this.text, {
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.height,
    this.color = Colors.black,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height,
          color: color,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
