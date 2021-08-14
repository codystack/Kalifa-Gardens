import '../components/buyer_benefits_slide.dart';
import '../model/buyer_benefit.dart';
import 'package:flutter/material.dart';

class BuyerBenefitItem extends StatelessWidget {
//  final String title, desc;
//  final List slideItems;
  final BuyerBenefit? buyerBenefit;
  BuyerBenefitItem({this.buyerBenefit});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              buyerBenefit!.title!,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              buyerBenefit!.description!,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            BuyerBenefitSlide(buyerBenefit!.imageSlides!),
          ],
        ),
      ),
    );
  }
}
