import 'package:azkar_app2/model/zerk_notification_time.dart';
import 'package:azkar_app2/widget/app_drawer.dart';
import 'package:azkar_app2/widget/notification_setting.dart';
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
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    NotificationSetting(
                      time: ZekrNotificationTime(
                        hours: 7,
                        name: "أذكار الصباح",
                      ),
                      onPressed: () {
                        showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
