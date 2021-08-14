import '../controller/state_controller.dart';
import '../forms/setup_password_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

class SetupPassword extends StatelessWidget {
  SetupPassword(
      {Key? key,
      @required this.fullname,
      @required this.phone,
      @required this.otpID,
      @required this.email,
      @required this.gender,
      @required this.isAccepted,
      @required this.accountType,
      @required this.otpCode})
      : super(key: key);

  final String? otpID, fullname, email, phone, gender, accountType, otpCode;
  final bool? isAccepted;
  final _controller = Get.find<StateController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlayPro(
        isLoading: _controller.createAccount > 0 ? true : false,
        backgroundColor: Colors.black54,
        progressIndicator: const LoadingBouncingLine.circle(
          borderColor: Color(0xFF0A4D50),
          borderSize: 3.0,
          size: 120.0,
          backgroundColor: Color(0xFF0A4D50),
          duration: Duration(milliseconds: 500),
        ),
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
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back),
                  ),
                  Center(
                    child: Text(
                      'Setup Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF0A4D50),
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
