import 'package:azkar_app2/constance.dart';
import 'package:flutter/material.dart';

class NotificationsSetting extends StatelessWidget {
  final String name;
  final TimeOfDay time;
  final void Function() onPressed;

  const NotificationsSetting({
    required this.name,
    required this.time,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final String timeString = (time.hour <= 12
            ? "${time.hour == 12 ? time.hour : "0${time.hour}"}"
            : "${(time.hour - 12) == 12 ? (time.hour - 12) : "0${(time.hour - 12)}"}") +
        (":${time.minute < 10 ? "0${time.minute}" : time.minute}") +
        (time.hour <= 12 ? "ص" : "م");

    return Row(
      children: [
        Column(
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: greyTextColor,
              ),
            ),
            SizedBox(height: 5),
            Text(
              timeString,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: greyTextColor,
              ),
            ),
          ],
        ),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            "تغيير",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
