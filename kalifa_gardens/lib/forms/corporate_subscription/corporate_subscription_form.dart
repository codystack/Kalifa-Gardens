import 'package:demo_app/components/contract_of_sales.dart';
import 'package:demo_app/controller/state_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'form_step1.dart';
import 'form_step2.dart';

class CorporateSubscriptionForm extends StatefulWidget {
  @override
  _CorporateSubscriptionFormFormState createState() => _CorporateSubscriptionFormFormState();
}

class _CorporateSubscriptionFormFormState extends State<CorporateSubscriptionForm> {

  final _controller = Get.find<StateController>();

  @override
  void initState() {
    _controller.incrementCorporateSub();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.decrementCorporateSub();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Padding(
        padding: const EdgeInsets.all(8.0),
        // ignore: unrelated_type_equality_checks
        child: _controller.corporateSubStep == 1 ? FormStep1() : _controller.corporateSubStep == 2 ? FormStep2() : ContractOfSales(),
      ),
    );
  }
}
