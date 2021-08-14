import '../../components/contract_of_sales.dart';
import '../../controller/state_controller.dart';
import '../../forms/individual_subscription/form_step1.dart';
import '../../forms/individual_subscription/form_step2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class IndividualSubscriptionForm extends StatefulWidget {
  @override
  _IndividualSubscriptionFormState createState() =>
      _IndividualSubscriptionFormState();
}

class _IndividualSubscriptionFormState
    extends State<IndividualSubscriptionForm> {
  final _controller = Get.find<StateController>();

  @override
  void initState() {
    _controller.incrementIndividualSub();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.decrementIndividualSub();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
          padding: const EdgeInsets.all(8.0),
          // ignore: unrelated_type_equality_checks
          child: _controller.individualSubStep == 1
              ? FormStep1()
              : _controller.individualSubStep == 2
                  ? FormStep2()
                  : ContractOfSales()),
    );
  }
}
