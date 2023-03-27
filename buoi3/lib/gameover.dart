import 'package:buoi3/play_game.dart';
import 'package:buoi3/welcome_game.dart';
import 'package:flutter/material.dart';

int highestScore = 0;
int yourScore = 0;

class GameOver extends StatelessWidget {
  static String id = 'GameOver';

  GameOver();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Game Over',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text('Your Score: $yourScore',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              Text('High Score: $highestScore',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 30),
                          backgroundColor: Colors.white),
                      onPressed: () {
                       // time = 10;
                        Navigator.pushNamed(context, PlayGame.id);
                      },
                      child: const Icon(
                        Icons.restart_alt,
                        color: Colors.purpleAccent,
                        size: 30,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 30),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        Navigator.pushNamed(context, WelcomeGame.id);
                      },
                      child: const Icon(
                        Icons.home,
                        color: Colors.purpleAccent,
                        size: 30,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
