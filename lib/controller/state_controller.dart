// import 'dart:developer';

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kalifa_gardens/model/business/business_types.dart';
import 'package:kalifa_gardens/model/faqs/faq_response.dart';
import 'package:kalifa_gardens/model/policy/policy_response.dart';
import 'package:kalifa_gardens/model/terms/terms_response.dart';
import 'package:kalifa_gardens/util/constants.dart';
import 'package:kalifa_gardens/util/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  var faqData = [].obs;
  var newsData = [].obs;
  var termsData = {}.obs;
  var userData;
  var policyData = {}.obs;
  var businessTypes = [].obs;

  var bankAccountData = {}.obs;
  var plotTypes = [].obs;
  var propertyInfoData = {}.obs;
  var contactInfoData = {}.obs;

  var isLoading = false.obs;

  var quantityCounter = 1.obs;
  var totalPrice = 0.0.obs;
  var unitPrice = 0.0;

  var isPurchase = false.obs;

  //After register interest. Save to access in next screen (Offer Letter)
  var currApplicationID = 0.obs;
  var selectedSize = 0.obs;
  var selectedQuantity = 0.obs;
  var totalAmount = 0.obs;

  _init() async {
    try {
      final faqResp = await APIService().getFAQs();
      debugPrint("FAQ RESP => ${faqResp.body}");
      Map<String, dynamic> faqMap = jsonDecode(faqResp.body);
      FAQResponse faqsData = FAQResponse.fromJson(faqMap);
      debugPrint("FAQs CONTENT => ${faqsData.data}");
      setFAQs(faqsData.data);

      final termsResp = await APIService().getTandC();
      debugPrint("TERMS RESP => ${termsResp.body}");
      Map<String, dynamic> termsMap = jsonDecode(termsResp.body);
      TermsResponse termsData = TermsResponse.fromJson(termsMap);
      debugPrint("TERMS CONTENT => ${termsData.data.attributes.content}");
      setTerms(termsMap);

      final policyResp = await APIService().getPolicy();
      debugPrint("POLICY RESP => ${policyResp.body}");
      Map<String, dynamic> policyMap = jsonDecode(policyResp.body);
      PolicyResponse policyData = PolicyResponse.fromJson(policyMap);
      debugPrint("POLICY CONTENT => ${policyData.data?.attributes?.content}");
      setPolicy(policyMap);

      final newsResp = await APIService().getNews();
      debugPrint("NEWS RESP => ${newsResp.body}");
      Map<String, dynamic> newsMap = jsonDecode(newsResp.body);
      FAQResponse newsData = FAQResponse.fromJson(newsMap);
      debugPrint("NEWS CONTENT => ${newsData.data}");
      setNews(newsData.data);

      final businessResp = await APIService().getBusinessType();
      debugPrint("BUSINESS TYPES RESP => ${businessResp.body}");
      Map<String, dynamic> bizMap = jsonDecode(businessResp.body);
      BusinessTypeResponse bizData = BusinessTypeResponse.fromJson(bizMap);
      debugPrint("BUSINESS TYPES CONTENT => ${bizData.data}");
      setBusinessType(bizData.data);
    } on SocketException {
      Constants.toast("Check your internet connection");
    } catch (e) {
      debugPrint("ONERROR::: >> ${e.toString()}");
    }
  }

  _tokenInit(_token) async {
    try {
      final plotResp = await APIService().getPlotTypes(_token);
      print("PLOT TYPES:: >> ${plotResp.body}");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() async {
    super.onInit();
    final prefs = await SharedPreferences.getInstance();
    final _token = prefs.getString("accessToken") ?? "";
    // bool _isAuthenticated = prefs.getBool("loggedIn") ?? false;
    _init();
    if (_token.isNotEmpty) {
      _tokenInit(_token);
    }
  }

  void setCurrApplicationID(int id) {
    currApplicationID.value = id;
  }

  void setSelectedPlotSize(int size) {
    selectedSize.value = size;
  }

  void setFAQs(var faqs) {
    faqData.value.addAll(faqs);
  }

  void setTerms(var terms) {
    termsData.value = terms;
  }

  void setUserData(var data) {
    userData = data;
  }

  void setPolicy(var policy) {
    policyData.value = policy;
  }

  void setNews(var news) {
    newsData.value.addAll(news);
  }

  void setBankAccount(var bankAccount) {
    bankAccountData.value = bankAccount;
  }

  void setContactInfo(var contactInfo) {
    contactInfoData.value = contactInfo;
  }

  void setPropertyInfo(var propertyInfo) {
    propertyInfoData.value = propertyInfo;
  }

  void setPlotTypes(var data) {
    plotTypes.value.addAll(data);
  }

  void setBusinessType(var bizType) {
    businessTypes.value.addAll(bizType);
  }

  void setSelectedQuantity(int quantity) {
    selectedQuantity.value = quantity;
  }

  void setTotalAmount(int total) {
    totalAmount.value = total;
  }

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

  // void triggerVerify(bool state) {
  //   if (state == true) {
  //     verifyCode += 1;
  //   } else {
  //     verifyCode -= 1;
  //   }
  // }

  // void triggerCreateAccount(bool state) {
  //   if (state == true) {
  //     createAccount += 1;
  //   } else {
  //     createAccount -= 1;
  //   }
  // }

  void triggerReset(bool state) {
    if (state == true) {
      resetPass += 1;
    } else {
      resetPass -= 1;
    }
  }

  // void triggerForgot(bool state) {
  //   if (state == true) {
  //     forgotPass += 1;
  //   } else {
  //     forgotPass -= 1;
  //   }
  // }

  // void triggerLogin(bool state) {
  //   if (state == true) {
  //     login += 1;
  //   } else {
  //     login -= 1;
  //   }
  // }

  void setLoading(bool state) {
    isLoading.value = state;
  }

  void triggerPurchase(bool state) {
    isPurchase.value = state;
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
