import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

import '../components/pinfield.dart';
import '../controller/state_controller.dart';
import '../util/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

class Verification extends StatefulWidget {
  const Verification(
      {Key? key,
      this.fullname,
      this.phone,
      @required this.otpID,
      @required this.email,
      this.expiresAt,
      this.gender,
      this.isAccepted,
      this.accountType,
      this.bizName,
      this.bizType,
      this.website})
      : super(key: key);

  final String? otpID, fullname, email, phone, gender, accountType, expiresAt;
  final bool? isAccepted;
  final String? bizName, bizType, website;

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  var counter;
  bool _isTimedOut = false;
  final _controller = Get.find<StateController>();
  String? _id;
  TextEditingController _field1Controller = TextEditingController();
  TextEditingController _field2Controller = TextEditingController();
  TextEditingController _field3Controller = TextEditingController();
  TextEditingController _field4Controller = TextEditingController();

  // var _otpCode;

  CountdownTimerController? controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 3;

  Future<void> _resend() async {
    setState(() {
      _isTimedOut = false;
    });

    _controller.setLoading(true);

    final response = await APIService().resendOTP(widget.otpID!);
    print('${jsonDecode(response.body)}');

    _controller.setLoading(false);

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Code sent successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          // backgroundColor: Color(0xFF0A4D50),
          backgroundColor: Color(0xFF0A4D50),
          textColor: Colors.white,
          fontSize: 16.0);

      controller!.start();
    } else {
      Fluttertoast.showToast(
        msg: "Code not sent. Try again",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        // backgroundColor: Color(0xFF0A4D50),
        backgroundColor: Color(0xFF0A4D50),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _id = widget.otpID;
    });
    if (!_isTimedOut) {
      controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
    }
  }

  void onEnd() {
    print('onEnd');
    setState(() {
      _isTimedOut = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

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
                      'Verification',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // color: Color(0xFF0A4D50),
                        color: Color(0xFF0A4D50),
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24.0,
              ),
              Center(
                child: Text(
                  'Please enter 4-digit code sent to ${widget.email}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFieldOTP(
                    first: true,
                    last: false,
                    otpID: widget.otpID,
                    email: widget.email,
                    phone: widget.phone,
                    gender: widget.gender,
                    fullname: widget.fullname,
                    isAccepted: widget.isAccepted,
                    accountType: widget.accountType,
                    controller: _field1Controller,
                    bizName: widget.bizName,
                    bizType: widget.bizType,
                    website: widget.website,
                    otpCode:
                        "${_field1Controller.text}${_field2Controller.text}${_field3Controller.text}${_field4Controller.text}",
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  TextFieldOTP(
                    first: false,
                    last: false,
                    otpID: widget.otpID,
                    email: widget.email,
                    phone: widget.phone,
                    gender: widget.gender,
                    fullname: widget.fullname,
                    isAccepted: widget.isAccepted,
                    accountType: widget.accountType,
                    controller: _field2Controller,
                    bizName: widget.bizName,
                    bizType: widget.bizType,
                    website: widget.website,
                    otpCode:
                        "${_field1Controller.text}${_field2Controller.text}${_field3Controller.text}${_field4Controller.text}",
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  TextFieldOTP(
                    first: false,
                    last: false,
                    otpID: widget.otpID,
                    email: widget.email,
                    phone: widget.phone,
                    gender: widget.gender,
                    fullname: widget.fullname,
                    isAccepted: widget.isAccepted,
                    accountType: widget.accountType,
                    controller: _field3Controller,
                    bizName: widget.bizName,
                    bizType: widget.bizType,
                    website: widget.website,
                    otpCode:
                        "${_field1Controller.text}${_field2Controller.text}${_field3Controller.text}${_field4Controller.text}",
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  TextFieldOTP(
                    first: false,
                    last: true,
                    otpID: widget.otpID,
                    email: widget.email,
                    phone: widget.phone,
                    gender: widget.gender,
                    fullname: widget.fullname,
                    isAccepted: widget.isAccepted,
                    accountType: widget.accountType,
                    controller: _field4Controller,
                    bizName: widget.bizName,
                    bizType: widget.bizType,
                    website: widget.website,
                    otpCode:
                        "${_field1Controller.text}${_field2Controller.text}${_field3Controller.text}${_field4Controller.text}",
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _isTimedOut
                      ? Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () => _resend,
                            child: Text(
                              'Resend code',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              padding: const EdgeInsets.all(18.0),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Resend code in ',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            CountdownTimer(
                              endTime: endTime,
                              onEnd: onEnd,
                              widgetBuilder: (_, CurrentRemainingTime? time) {
                                if (time == null) {
                                  return Text('00:00');
                                }
                                return Text(
                                  ' ${time.min == null ? '00' : time.min}:${time.sec}',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
