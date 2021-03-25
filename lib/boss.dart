import 'package:flutter/material.dart';
import 'dart:math';

class GolemBoss extends StatelessWidget {
  final int golemSpriteCount;
  final String golemDirection;

  GolemBoss({this.golemSpriteCount, this.golemDirection});

  @override
  Widget build(BuildContext context) {
    if (golemDirection == "right") {
      return Container(
        alignment: Alignment.bottomCenter,
        width: 150,
        height: 150,
        child: Image.asset(
            'assets/images/golem' + golemSpriteCount.toString() + '.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          width: 150,
          height: 150,
          child: Image.asset(
              'assets/images/golem' + golemSpriteCount.toString() + '.png'),
        ),
      );
    }
  }
}
