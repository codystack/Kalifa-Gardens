import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:kalifa_gardens/model/forgot_response.dart';
import 'package:kalifa_gardens/screens/new_password.dart';
import 'package:kalifa_gardens/util/service.dart';

import '../controller/state_controller.dart';
import '../screens/setup_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//ignore: must_be_immutable
class TextFieldOTP extends StatefulWidget {
  const TextFieldOTP(
      {Key? key,
      this.first,
      this.last,
      this.fullname,
      @required this.phone,
      @required this.otpID,
      @required this.email,
      this.gender,
      @required this.isAccepted,
      @required this.accountType,
      @required this.otpCode,
      @required this.controller,
      this.bizName,
      this.bizType,
      this.website})
      : super(key: key);

  final bool? first;
  final last;
  final String? otpID, fullname, email, phone, gender, accountType, otpCode;
  final bool? isAccepted;
  final String? bizType, bizName, website;
  final TextEditingController? controller;

  @override
  _TextFieldOTPState createState() => _TextFieldOTPState();
}

class _TextFieldOTPState extends State<TextFieldOTP> {
  var _bgColor;
  final _controller = Get.find<StateController>();

  Future<void> _triggerVerify() async {
    _controller.setLoading(true);

    if (widget.accountType != "forgotPass") {
      Future.delayed(Duration(seconds: 5), () {
        _controller.setLoading(false);

        if (widget.accountType == 'corporate') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SetupPassword(
                accountType: widget.accountType,
                otpID: widget.otpID,
                bizName: widget.bizName,
                isAccepted: widget.isAccepted,
                bizType: widget.bizType,
                phone: widget.phone,
                email: widget.email,
                otpCode: widget.otpCode,
                website: widget.website,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SetupPassword(
                accountType: widget.accountType,
                otpID: widget.otpID, //Challenge ID
                fullname: widget.fullname,
                isAccepted: widget.isAccepted,
                gender: widget.gender,
                phone: widget.phone,
                email: widget.email,
                otpCode: widget.otpCode,
              ),
            ),
          );
        }
      });
    } else {
      Map body = {
        'email': widget.email,
        'verification': {'challenge_id': widget.otpID, 'otp': widget.otpCode}
      };

      final response = await APIService().forgotPassword(body);

      print(jsonDecode(response.body));

      if (response.statusCode == 200) {
        _controller.setLoading(false);

        Map<String, dynamic> map = jsonDecode(response.body);
        var forgot = ForgotResponse.fromJson(map);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewPassword(
              email: widget.email,
              resetToken: forgot.resetToken,
            ),
          ),
        );
      } else {
        _controller.setLoading(false);
        Fluttertoast.showToast(
            msg: "Operation failed. Try again",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Color(0xFF0A4D50),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.18,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1) {
              setState(() {
                _bgColor = Color(0xFF0A4D50);
              });
            } else {
              setState(() {
                _bgColor = Colors.white;
              });
            }

            if (value.length == 1 && widget.last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 1 && widget.first == false) {
              FocusScope.of(context).previousFocus();
            }
            if (value.length == 1 && widget.last == true) {
              //Perform operation here
              _triggerVerify();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Color(0xFF0A4D50),
//              backgroundColor: _bgColor,
          ),
          controller: widget.controller,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey, width: 3.0, style: BorderStyle.solid),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Color(0xFF0A4D50),
                  width: 3.0,
                  style: BorderStyle.solid),
            ),
            focusColor: Color(0xFF0A4D50),
            fillColor: _bgColor,
            contentPadding: const EdgeInsets.all(16.0),
          ),
        ),
      ),
    );
  }
}

textFieldOTP({BuildContext? context, bool? first, last, bgColor}) {
  return Container(
    height: 100,
    width: MediaQuery.of(context!).size.width * 0.18,
    child: AspectRatio(
      aspectRatio: 1.0,
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 1 && first == false) {
            FocusScope.of(context).previousFocus();
          }
          if (value.length == 1 && last == true) {
            //Perform operation here

          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Color(0xFF0A4D50),
            backgroundColor: bgColor),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey, width: 3.0, style: BorderStyle.solid),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFF0A4D50), width: 3.0, style: BorderStyle.solid),
          ),
          focusColor: Color(0xFF0A4D50),
        ),
      ),
    ),
  );
}
