import 'package:flutter/material.dart';

class TaskInfo {
  static int idTask = 1;
  String title = 'Task $idTask';
  String fromTime = '11:00', endTime = '23:00';
  String dealine = '23/11/2022';
  bool checkFavourited = false;
  bool checkCompleted = false;
  late Color color = Colors.red;
}
