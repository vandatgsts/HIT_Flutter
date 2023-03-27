import 'dart:async';
import 'dart:math';
import 'package:buoi3/gameover.dart';
import 'package:flutter/material.dart';

class PlayGame extends StatefulWidget {
  static const id = "play_game";

  PlayGame();

  @override
  State<PlayGame> createState() => _PlayGame();
}

late int pt1, pt2, ans, correctAns;
int score = 0;
int status = 1;
String chooseCal = '+';
List<String> calculation = ['+', '-', '*', '/'];
late Timer _timer;
int time = 10;

class _PlayGame extends State<PlayGame> {
  @override
  void initState() {
    super.initState();
    timeCD();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.purpleAccent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                AnimatedContainer(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  height: 10,
                  width: MediaQuery.of(context).size.width * time / 10,
                  duration: time != 10
                      ? const Duration(seconds: 1)
                      : const Duration(seconds: 0),
                ),
              ],
            ),
            Text(
              '$score',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$pt1 $chooseCal $pt2 = $ans',
                  style: const TextStyle(fontSize: 40, color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 40),
                        backgroundColor: Colors.white),
                    onPressed: () {
                      checkAnsTrue();
                      handleSatus();
                      setState(() {});
                      randomPt();
                    },
                    child: const Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 100,
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 40),
                        backgroundColor: Colors.white),
                    onPressed: () {
                      checkAnsFalse();
                      handleSatus();
                      setState(() {});
                      randomPt();
                    },
                    child: const Icon(
                      Icons.dangerous_outlined,
                      color: Colors.red,
                      size: 100,
                    )),
              ],
            )
          ],
        ),
      )),
    ));
  }

  timeCD() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      time--;
      if (time == 0) {
        status = 0;
        timer.cancel();
        handleSatus();
      }
      setState(() {});
    });
  }

  handleSatus() {
    time = 10;
    if (status == 0) {
      highestScore = max(score, highestScore);
      yourScore = score;
      score = 0;

      Navigator.pushNamed(context, GameOver.id);
    }
  }
}

randomPt() {
  chooseCal = calculation[Random().nextInt(3)];
  pt1 = Random().nextInt(100);
  pt2 = Random().nextInt(100);
  switch (chooseCal) {
    case '+':
      ans = pt1 + pt2 + Random().nextInt(2) - 1;
      correctAns = pt1 + pt2;
      break;
    case '-':
      ans = pt1 - pt2 + Random().nextInt(2) - 1;
      correctAns = pt1 - pt2;
      break;
    case '*':
      ans = pt1 * pt2 + Random().nextInt(2) - 1;
      correctAns = pt1 * pt2;
      break;
  }
}

// bam vao o dung
checkAnsTrue() {
  if (ans == correctAns) {
    status = 1;
    score++;
  } else {
    status = 0;
  }
}

// bam vao o sai
checkAnsFalse() {
  if (ans != correctAns) {
    status = 1;
    score++;
  } else {
    status = 0;
  }
}
