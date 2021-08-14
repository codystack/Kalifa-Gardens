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
      @required this.fullname,
      @required this.phone,
      @required this.otpID,
      @required this.email,
      @required this.gender,
      @required this.isAccepted,
      @required this.accountType,
      @required this.otpCode,
      @required this.controller})
      : super(key: key);

  final bool? first;
  final last;
  final String? otpID, fullname, email, phone, gender, accountType, otpCode;
  final bool? isAccepted;
  final TextEditingController? controller;

  @override
  _TextFieldOTPState createState() => _TextFieldOTPState();
}

class _TextFieldOTPState extends State<TextFieldOTP> {
  var _bgColor;
  final _controller = Get.find<StateController>();

  void _triggerVerify() {
    _controller.triggerVerify(true);
    Future.delayed(Duration(seconds: 5), () {
      _controller.triggerVerify(false);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SetupPassword(
                    accountType: widget.accountType as String,
                    otpID: widget.otpID as String,
                    fullname: widget.fullname as String,
                    isAccepted: widget.isAccepted as bool,
                    gender: widget.gender as String,
                    phone: widget.phone as String,
                    email: widget.email as String,
                    otpCode: widget.otpCode as String,
                  )));
    });
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
