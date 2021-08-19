import 'package:flutter/material.dart';
import '../model/onbarding_slides.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      slideList[index].image!,
      fit: BoxFit.cover,
      repeat: ImageRepeat.noRepeat,
    );
  }
}
