import 'dart:developer';

import 'package:get/get.dart';

class StateController extends GetxController {
  var purchasePlotStepCount = 0.obs;
  var individualSubStep = 0.obs;
  var corporateSubStep = 0.obs;

  var verifyCode = 0.obs;
  var createAccount = 0.obs;
  var login = 0.obs;
  var isAccepted = 0.obs;
  var forgotPass = 0.obs;
  var resetPass = 0.obs;

  var quantityCounter = 1.obs;

  var totalPrice = 0.0.obs;

  var unitPrice = 0.0;

  void increment() {
    purchasePlotStepCount++;
  }

  void decrement() {
    purchasePlotStepCount--;
  }

  void incrementIndividualSub() {
    individualSubStep++;
  }

  void decrementIndividualSub() {
    individualSubStep--;
  }

  void incrementCorporateSub() {
    corporateSubStep++;
  }

  void decrementCorporateSub() {
    corporateSubStep--;
  }

  void setUnitPrice(int price) {
    unitPrice = price as double;
  }

  void incrementQuantity() {
    quantityCounter++;
  }

  void decrementQuantity() {
    quantityCounter--;
  }

  void triggerVerify(bool state) {
    if (state == true) {
      verifyCode += 1;
    } else {
      verifyCode -= 1;
    }
  }

  void triggerCreateAccount(bool state) {
    if (state == true) {
      createAccount += 1;
    } else {
      createAccount -= 1;
    }
  }

  void triggerReset(bool state) {
    if (state == true) {
      resetPass += 1;
    } else {
      resetPass -= 1;
    }
  }

  void triggerForgot(bool state) {
    if (state == true) {
      forgotPass += 1;
    } else {
      forgotPass -= 1;
    }
  }

  void triggerLogin(bool state) {
    if (state == true) {
      login += 1;
    } else {
      login -= 1;
    }
  }

  void verifyAccepted(bool state) {
    if (state == true) {
      isAccepted = 0.obs;
    } else {
      isAccepted += 1;
    }
  }

  void setTotalPrice(var unit, var size, var quantity) {
    totalPrice.value = (unit * size * quantity);
  }

  void resetAll() {
    purchasePlotStepCount = 0.obs;
    individualSubStep = 0.obs;
    corporateSubStep = 0.obs;
    verifyCode = 0.obs;
    createAccount = 0.obs;
    login = 0.obs;
  }
}
