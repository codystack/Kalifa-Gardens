import 'package:flutter/material.dart';

class BuyerBenefitSlideItem extends StatelessWidget {
  final int? index;
  final List<String>? carouselList;
  BuyerBenefitSlideItem({this.index, this.carouselList});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          carouselList![index!],
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
