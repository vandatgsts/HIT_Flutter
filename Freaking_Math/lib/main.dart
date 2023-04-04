import 'package:buoi3/gameover.dart';
import 'package:buoi3/play_game.dart';
import 'package:buoi3/welcome_game.dart';
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
      initialRoute: WelcomeGame.id,
      routes:{
        WelcomeGame.id: (context) => WelcomeGame(),
        PlayGame.id: (context)=>PlayGame(),
        GameOver.id:(context)=>GameOver()
      },
    );
  }
}

