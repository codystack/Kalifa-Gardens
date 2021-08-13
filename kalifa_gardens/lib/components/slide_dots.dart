import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(
          milliseconds: 150
        ),
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      height: isActive ? 16.0 : 14.0,
      width: isActive ? 16.0 : 14.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        border: Border.all(color: Colors.white, width: 2.0, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.circular(12.0))
      ),
    );
  }
}