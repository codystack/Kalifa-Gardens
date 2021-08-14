import 'package:flutter/material.dart';
import '../model/onbarding_slides.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          slideList[index].image!,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
