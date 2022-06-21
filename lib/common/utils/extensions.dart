import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringX on String {
  //"yyyy-MM-dd hh:mm:ss"
  DateTime convertStringToDateTime(String format) {
    return DateFormat(format).parse(this);
  }

  String formatDistance(double distance){
    return NumberFormat("###.0").format(distance);
  }

}

extension DoubleX on Double{
  String formatDistance(double distance){
    return NumberFormat("###.0").format(distance);
  }

}

extension DateTimeX on DateTime {
  //"yyyy-MM-dd hh:mm:ss"


  String convertDateTimeToString(String format) {
    return DateFormat(format).format(this);
  }

}

extension TimeOfDayX on TimeOfDay {
  //"yyyy-MM-dd hh:mm:ss"

}

extension intX on int {
  //"yyyy-MM-dd hh:mm:ss"
  String convertDuration() {
    int hour = ((this / 3600) % 60).floor();
    int minute = ((this / 60) % 60).floor();
    int seconds = (this % 60).floor();
    if (hour < 23 && minute < 59) {
      if (seconds >= 30) {
        ++minute;
      }
      if (minute == 60) {
        minute = 0;
        ++hour;
      }
    }
    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
  }

  String convertDurationTotalUnbilled() {
    int hour = ((this / 60) % 60).floor();
    int minute = (this % 60).floor();
    // int seconds = (this % 60).floor();
    if (hour < 23 && minute < 59) {
      // if (seconds >= 30) {
      //   ++minute;
      // }
      if (minute == 60) {
        minute = 0;
        ++hour;
      }
    }
    return "${hour}h, ${minute}m";
  }
}
