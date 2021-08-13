
import 'package:get/get.dart';

class StateController extends GetxController {

  var purchasePlotStepCount = 0.obs;
  var individualSubStep = 0.obs;
  var corporateSubStep = 0.obs;

  var verifyCode = 0.obs;
  var createAccount = 0.obs;

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

  void triggerVerify(bool state) {
    if (state == true) {
      verifyCode+=1;
    }
    else {
      verifyCode-=1;
    }
  }

  void triggerCreateAccount(bool state) {
    if (state == true) {
      createAccount+=1;
    }
    else {
      createAccount-=1;
    }
  }

  void resetAll() {
    purchasePlotStepCount = 0.obs;
    individualSubStep = 0.obs;
    corporateSubStep = 0.obs;
    verifyCode = 0.obs;
    createAccount = 0.obs;
  }

}