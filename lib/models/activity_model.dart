import 'package:flutter/material.dart';


class Activity {
  String title;
  String? description;
  DateTime date;
  TimeOfDay time;
  bool isDone;

  Activity({
      required this.title,
      this.description,
      required this.date,
      required this.time,
      this.isDone = false,
  });
}