import 'package:azkar_app2/widget/centered_text.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final double? height, width;
  final double fontSize, textHeight;
  final FontWeight fontWeight;
  final Color color;
  final Color textColor;

  const CustomCard({
    required this.text,
    this.height,
    this.width,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.white,
    this.textHeight = 1,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          child: CenteredText(
            text,
            fontSize: fontSize,
            fontWeight: fontWeight,
            height: textHeight,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
