import 'dart:async';
import 'package:flutter/material.dart';
import 'button.dart';
import 'character.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double heroX = 0;
  static double heroY = 1;
  double time = 0;
  double height = 0;
  double initialHeight = heroY;

  void preJump() {
    time = 0;
    initialHeight = heroY;
  }

  void jump() {
    preJump();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 5 * time;

      if (initialHeight - height > 1) {
        setState(() {
          heroY = 1;
        });
      } else {
        setState(() {
          heroY = initialHeight - height;
        });
      }
    });
  }

  void moveRight() {
    setState(() {
      heroX += 0.02;
    });
  }

  void moveLeft() {
    setState(() {
      heroX -= 0.02;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.blue,
            child: AnimatedContainer(
              alignment: Alignment(heroX, heroY),
              duration: Duration(milliseconds: 0),
              child: MyHero(),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  function: moveLeft,
                ),
                MyButton(
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                  function: jump,
                ),
                MyButton(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  function: moveRight,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
