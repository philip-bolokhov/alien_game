import 'package:flutter/material.dart';

class MyHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: Image.asset('assets/images/hero.png'),
    );
  }
}
