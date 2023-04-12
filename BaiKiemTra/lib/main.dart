import 'package:baikiemtra/Screen/AddTask.dart';
import 'package:baikiemtra/Screen/BoardScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: BoardScreen.id, routes: {
      BoardScreen.id: (context) => BoardScreen(),
      AddTask.id: (context) => AddTask(),
    });
  }
}
