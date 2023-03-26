import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../controller/state_controller.dart';
import '../forms/setup_password_form.dart';

class SetupPassword extends StatelessWidget {
  SetupPassword(
      {Key? key,
      this.fullname,
      @required this.phone,
      @required this.otpID,
      @required this.email,
      this.gender,
      @required this.isAccepted,
      @required this.accountType,
      this.bizName,
      this.bizType,
      this.website,
      @required this.otpCode})
      : super(key: key);

  final String? otpID, fullname, email, phone, gender, accountType, otpCode;
  final bool? isAccepted;
  final String? bizName, bizType, website;
  final _controller = Get.find<StateController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlayPro(
        isLoading: _controller.isLoading.value,
        backgroundColor: Colors.black54,
        progressIndicator: const CircularProgressIndicator.adaptive(),
        child: Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              SizedBox(
                height: 24.0,
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Center(
                    child: Text(
                      'Setup Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0A4D50),
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 21.0,
              ),
              Center(
                child: Text(
                  'Please create a secure password using the following criteria',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SetupPasswordForm(
                accountType: accountType,
                otpID: otpID,
                fullname: fullname,
                isAccepted: isAccepted,
                gender: gender,
                phone: phone,
                email: email,
                otpCode: otpCode,
                bizName: bizName,
                bizType: bizType,
                website: website,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
