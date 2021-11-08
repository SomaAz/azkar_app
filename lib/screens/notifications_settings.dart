import 'package:azkar_app2/widget/app_drawer.dart';
import 'package:azkar_app2/widget/notifications_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationsSettings extends StatefulWidget {
  static const String routeName = "notifications-settings";

  @override
  State<NotificationsSettings> createState() => _NotificationsSettingsState();
}

class _NotificationsSettingsState extends State<NotificationsSettings> {
  TimeOfDay time = TimeOfDay(hour: 3, minute: 55);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "إعدادات الإشعار",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              NotificationsSetting(
                name: "أذكار الصباح",
                time: time,
                onPressed: () async {
                  setState(() async {
                    time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now()) as TimeOfDay;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
