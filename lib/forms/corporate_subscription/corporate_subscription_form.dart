import 'package:kalifa_gardens/util/preference_manager.dart';

import '../../components/contract_of_sales.dart';
import '../../controller/state_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'form_step1.dart';
import 'form_step2.dart';

class CorporateSubscriptionForm extends StatefulWidget {
  @override
  _CorporateSubscriptionFormFormState createState() =>
      _CorporateSubscriptionFormFormState();
}

class _CorporateSubscriptionFormFormState
    extends State<CorporateSubscriptionForm> {
  final _controller = Get.find<StateController>();
  late PreferenceManager _manager;

  @override
  void initState() {
    super.initState();
    _manager = PreferenceManager(context);
    _controller.incrementCorporateSub();
  }

  @override
  void dispose() {
    _controller.decrementCorporateSub();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: _controller.corporateSubStep.value == 1
            ? FormStep1()
            : _controller.corporateSubStep.value == 2
                ? FormStep2()
                : ContractOfSales(
                    manager: _manager,
                  ),
      ),
    );
  }
}
