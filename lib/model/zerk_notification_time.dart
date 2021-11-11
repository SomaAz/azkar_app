class ZekrNotificationTime {
  final String name;
  final int hours, minutes;
  final bool isAm;

  ZekrNotificationTime({
    required this.name,
    required this.hours,
    this.minutes = 00,
    this.isAm = true,
  });
}
