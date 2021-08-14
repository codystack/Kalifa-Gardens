import '../../forms/corporate_subscription/corporate_subscription_form.dart';
import '../../forms/individual_subscription/individual_subscription_form.dart';
import 'package:flutter/material.dart';

class PurchasePlotStep5 extends StatefulWidget {
  @override
  _PurchasePlotStep5State createState() => _PurchasePlotStep5State();
}

class _PurchasePlotStep5State extends State<PurchasePlotStep5> {
  String? userType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userType = "individual";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subscription Form',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Color(0xFF0A4D50),
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
        SizedBox(
          height: 21.0,
        ),
        userType == "individual"
            ? IndividualSubscriptionForm()
            : CorporateSubscriptionForm()
      ],
    );
  }
}
