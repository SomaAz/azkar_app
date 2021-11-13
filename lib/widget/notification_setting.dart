import 'package:azkar_app2/model/zerk_notification_time.dart';
import 'package:flutter/material.dart';
import 'package:azkar_app2/helper/arabic_number_converter.dart';

class NotificationSetting extends StatelessWidget {
  final ZekrNotificationTime time;
  final String name;
  final void Function() onPressed;

  const NotificationSetting({
    required this.time,
    required this.onPressed,
    required this.name,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Column(
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "${time.hours.convertToArabicNumber()}:${time.minutes > 10 ? time.minutes.convertToArabicNumber() : "${0.convertToArabicNumber()}${time.minutes.convertToArabicNumber()}"} ${time.isAm ? "ص" : "م"}",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10)),
          elevation: MaterialStateProperty.all(0),
        ),
      ),
    );
  }
}
