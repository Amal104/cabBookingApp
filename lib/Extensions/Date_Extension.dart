import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute,);
  }
}

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay addHour(int hour) {
    return replacing(hour: this.hour + hour, minute: minute);
  }
}