import 'package:buoi6/Screen/Add_Task.dart';
import 'package:buoi6/Screen/Main_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        AddTask.id:(context)=>AddTask()
      }
    );
  }
}
