import 'dart:math';

import 'package:flutter/material.dart';

class JumpingHero extends StatelessWidget {
  final direction;

  JumpingHero({this.direction});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        width: 150,
        height: 150,
        child: Image.asset('assets/images/herojump.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          width: 150,
          height: 150,
          child: Image.asset('assets/images/herojump.png'),
        ),
      );
    }
  }
}
