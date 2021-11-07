import 'package:kalifa_gardens/util/preference_manager.dart';

import '../../components/contract_of_sales.dart';
import '../../controller/state_controller.dart';
import '../../forms/individual_subscription/form_step1.dart';
import '../../forms/individual_subscription/form_step2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndividualSubscriptionForm extends StatefulWidget {
  @override
  _IndividualSubscriptionFormState createState() =>
      _IndividualSubscriptionFormState();
}

class _IndividualSubscriptionFormState
    extends State<IndividualSubscriptionForm> {
  final _controller = Get.find<StateController>();
  late PreferenceManager _manager;

  @override
  void initState() {
    _manager = PreferenceManager(context);
    _controller.incrementIndividualSub();
    super.initState();
  }

  @override
  void dispose() {
    _controller.decrementIndividualSub();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: _controller.individualSubStep.value == 1
            ? FormStep1()
            : _controller.individualSubStep.value == 2
                ? FormStep2()
                : ContractOfSales(
                    manager: _manager,
                  ),
      ),
    );
  }
}
