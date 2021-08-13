import 'package:flutter/material.dart';

class PurchasePlotStepIndicator extends StatelessWidget {
  bool isActive;
  PurchasePlotStepIndicator(this.isActive);

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
          color: isActive ? Color(0xFF6DA544) : Colors.transparent,
          border: Border.all(color: Color(0xFF6DA544), width: 2.0, style: BorderStyle.solid),
      ),
    );
  }
}