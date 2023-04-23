import 'package:flutter/material.dart';
import 'Screen/Add_Task.dart';
import 'Screen/Main_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: MainScreen.id, routes: {
      MainScreen.id: (context) => MainScreen(),
      AddTask.id: (context) => AddTask(),
    });
  }
}
