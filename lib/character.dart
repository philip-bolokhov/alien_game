import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class MyHero extends StatelessWidget {
  final direction;
  final midrun;

  MyHero({this.direction, this.midrun});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        width: 150,
        height: 150,
        child: midrun
            ? Image.asset('assets/images/hero.png')
            : Image.asset('assets/images/herorun.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          width: 150,
          height: 150,
          child: midrun
              ? Image.asset('assets/images/hero.png')
              : Image.asset('assets/images/herorun.png'),
        ),
      );
    }
  }
}
