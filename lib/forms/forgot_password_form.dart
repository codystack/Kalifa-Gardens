import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kalifa_gardens/controller/state_controller.dart';
import 'package:kalifa_gardens/model/otp_response.dart';
import 'package:kalifa_gardens/screens/verification.dart';
import 'package:kalifa_gardens/util/service.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _controller = Get.find<StateController>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();

  Future<void> _createOtp(String email, String type) async {
    _controller.triggerForgot(true);

    final response = await APIService().createOTP(email, type);

    print('Forgot RESP: ${jsonDecode(response.body)}');
    if (response.statusCode == 200) {
      _controller.triggerForgot(false);
      //All good now route to create otp screen
      Map<String, dynamic> otpMap = jsonDecode(response.body);
      var otp = OTPResponse.fromJson(otpMap);

      Fluttertoast.showToast(
          msg: 'OTP code sent to $email',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Color(0xFF0A4D50),
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Verification(
            email: _emailController.text,
            otpID: otp.id,
            accountType: "forgotPass",
          ),
        ),
      );
    } else {
      //Not successful. Show toast
      _controller.triggerForgot(false);
      Fluttertoast.showToast(
          msg: "Operation not successful. Try again",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Color(0xFF0A4D50),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email address',
                  hintText: 'Email address',
                  prefixIcon: Icon(Icons.email),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]')
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                color: Colors.black,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _createOtp(_emailController.text, "reset");
                    }
                  },
                  child: Text(
                    'Send Instruction',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    padding: const EdgeInsets.all(18.0),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
