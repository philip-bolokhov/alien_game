import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final text;
  final child;
  final function;
  static bool holdingButton = false;

  MyButton({this.text, this.child, this.function});
  bool userIsHoldingButton() {
    return holdingButton;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) {
          holdingButton = true;
          function();
        },
        onTapUp: (details) {
          holdingButton = false;
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.brown[200],
                child: child,
              ),
            ),
          ],
        ));
  }
} //MyButton
