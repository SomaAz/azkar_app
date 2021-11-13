import 'dart:convert';

import 'package:azkar_app2/model/zerk_notification_time.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationsProvider extends ChangeNotifier {
  final Map<String, ZekrNotificationTime> _notificationTimes = {};
  Future<ZekrNotificationTime?> getZekrNotificationTime(String name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? zekrNotificationTime;
    if (sharedPreferences.containsKey(name)) {
      zekrNotificationTime = sharedPreferences.getString(name);
      return ZekrNotificationTime.fromJson(json.decode(zekrNotificationTime!));
    } else {
      return null;
    }
  }

  void setZekrNotificationTime(String name, ZekrNotificationTime time) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    
    // sharedPreferences.setString(name, )
  }
}
