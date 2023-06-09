import 'package:kalifa_gardens/forms/new_password.dart';

import '../controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

class NewPassword extends StatelessWidget {
  NewPassword({Key? key, @required this.email, @required this.resetToken})
      : super(key: key);

  final String? email, resetToken;
  final _controller = Get.find<StateController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlayPro(
        isLoading: _controller.resetPass > 0 ? true : false,
        backgroundColor: Colors.black54,
        progressIndicator: const LoadingBouncingLine.circle(
          // borderColor: Color(0xFF0A4D50),
          borderColor: Color(0xFF0A4D50),
          borderSize: 3.0,
          size: 120.0,
          // backgroundColor: Color(0xFF0A4D50),
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Center(
                    child: Text(
                      'New Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          // color: Color(0xFF0A4D50),
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
              NewPasswordForm(
                email: email,
                resetToken: resetToken,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
