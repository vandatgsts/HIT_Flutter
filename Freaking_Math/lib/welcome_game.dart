import 'package:buoi3/play_game.dart';
import 'package:flutter/material.dart';

class WelcomeGame extends StatelessWidget {
  static final id = "welcome_game";

  WelcomeGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.purpleAccent[100]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Freaking Math',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                    backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, PlayGame.id);
                  randomPt();
                },
                child: Text(
                  'Start',
                  style:
                      TextStyle(fontSize: 25, color: Colors.purpleAccent[100]),
                ))
          ],
        ),
      ),
    );
  }
}
