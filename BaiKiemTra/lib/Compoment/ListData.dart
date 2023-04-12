

import 'package:flutter/material.dart';

import 'TaskInfo.dart';

List<Color> listColor=[Colors.red,Colors.yellow,Colors.green,Colors.cyan,Colors.deepPurple];
List<TaskInfo> listTask=[];
List<TaskInfo> listTaskFavourited=[];
List<TaskInfo> listTaskUnCompleted=[];
List<TaskInfo> listTaskCompleted=[];
List<bool> listCheckColor=List.generate(listColor.length, (index) => false);
