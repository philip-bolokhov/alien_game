import 'package:alien_game/boss.dart';
import 'package:flame/flame.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'button.dart';
import 'character.dart';
import 'jumpinghero.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int golemSpriteCount = 1;
  double golemPosX = 0.5;
  String golemDirection = 'left';

  static double heroX = 0;
  static double heroY = 1;
  double time = 0;
  double height = 0;
  double initialHeight = heroY;
  String direction = "right";
  bool midrun = false;
  bool midjump = false;

  void preJump() {
    time = 0;
    initialHeight = heroY;
  }

  void jump() {
    if (midjump == false) {
      midjump = true;
      preJump();
      Timer.periodic(Duration(milliseconds: 50), (timer) {
        time += 0.05;
        height = -4.9 * time * time + 5 * time;

        if (initialHeight - height > 1) {
          midjump = false;
          setState(() {
            heroY = 1;
            timer.cancel();
          });
        } else {
          setState(() {
            heroY = initialHeight - height;
          });
        }
      });
    }
  }

  void moveRight() {
    direction = "right";

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (MyButton().userIsHoldingButton() == true) {
        setState(() {
          heroX += 0.07;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void moveLeft() {
    direction = "left";
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (MyButton().userIsHoldingButton() == true) {
        setState(() {
          heroX -= 0.07;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 6,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/forest1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: AnimatedContainer(
                  alignment: Alignment(heroX, heroY),
                  duration: Duration(milliseconds: 0),
                  child: midjump
                      ? JumpingHero(
                          direction: direction,
                        )
                      : MyHero(
                          direction: direction,
                          midrun: midrun,
                        ),
                ),
              ),
              Container(
                alignment: Alignment(golemPosX, 1),
                child: GolemBoss(
                  golemDirection: golemDirection,
                  golemSpriteCount: golemSpriteCount,
                ),
              ),
            ],
          ),
        ),
        Container(height: 10, color: Colors.green),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.brown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  child: (Image.asset("assets/images/play.png")),
                ),
                MyButton(
                  child: (Image.asset("assets/images/melee.png")),
                ),
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
