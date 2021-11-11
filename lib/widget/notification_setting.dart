import 'package:azkar_app2/model/zerk_notification_time.dart';
import 'package:flutter/material.dart';

class NotificationSetting extends StatelessWidget {
  final ZekrNotificationTime time;
  final void Function() onPressed;

  const NotificationSetting({
    required this.time,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Column(
          children: [
            Text(
              time.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "${time.hours}:${time.minutes}${time.isAm ? "ص" : "م"}",
              style: TextStyle(
                fontSize: 20,
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
