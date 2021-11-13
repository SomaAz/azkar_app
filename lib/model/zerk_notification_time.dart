class ZekrNotificationTime {
  final int hours, minutes;
  final bool isAm;

  ZekrNotificationTime({
    required this.hours,
    this.minutes = 00,
    this.isAm = true,
  });

  ZekrNotificationTime.fromJson(Map data)
      : hours = data['hours'],
        minutes = data['minutes'],
        isAm = data["isAm"];
}
