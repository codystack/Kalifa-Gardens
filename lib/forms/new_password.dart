import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kalifa_gardens/model/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/state_controller.dart';
import '../screens/success.dart';
import '../util/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordForm extends StatefulWidget {
  const NewPasswordForm(
      {Key? key, @required this.resetToken, @required this.email})
      : super(key: key);

  final String? resetToken, email;

  @override
  _NewPasswordFormState createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isNumberOk = false,
      _isLowercaseOk = false,
      _isCapitalOk = false,
      _isSpecialCharOk = false;
  bool _obscureText = true;

  final _controller = Get.find<StateController>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  _togglePass() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _resetPassword(String password, String confirm) async {
    setState(() {
      _controller.triggerReset(true);
    });

    Map _body = {
      'resetToken': widget.resetToken,
      'password': password,
      'passwordConfirmation': confirm
    };

    final response = await APIService().resetPassword(_body);

    print('FORGT RESP: ${jsonDecode(response.body)}');

    if (response.body.toString().contains('Invalid verification otp')) {
      Navigator.pop(context);
    }

    if (response.statusCode == 200) {
      _controller.triggerReset(false);

      // Map<String, dynamic> loginMap = jsonDecode(response.body);
      // var login = LoginResponse.fromJson(loginMap);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Success()),
      );

      Fluttertoast.showToast(
          msg: "Password changed successfully.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Color(0xFF0A4D50),
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      _controller.triggerReset(false);
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
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () => _togglePass(),
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please type a password';
                  }
                  if (!_isNumberOk ||
                      !_isCapitalOk ||
                      !_isLowercaseOk ||
                      !_isSpecialCharOk) {
                    return 'Weak password. See hint below';
                  }
                  if (value.length < 8) {
                    return 'Password too short. 8 characters min';
                  }

                  return null;
                },
                onChanged: (value) {
                  if (value.contains(new RegExp(r'[0-9]'))) {
                    setState(() {
                      _isNumberOk = true;
                    });
                  } else {
                    setState(() {
                      _isNumberOk = false;
                    });
                  }

                  if (value.contains(new RegExp(r'[A-Z]'))) {
                    setState(() {
                      _isCapitalOk = true;
                    });
                  } else {
                    setState(() {
                      _isCapitalOk = false;
                    });
                  }

                  if (value.contains(new RegExp(r'[a-z]'))) {
                    setState(() {
                      _isLowercaseOk = true;
                    });
                  } else {
                    setState(() {
                      _isLowercaseOk = false;
                    });
                  }

                  if (value
                      .contains(new RegExp(r'[!@#$%^&*(),.?"_:;{}|<>/+=-]'))) {
                    setState(() {
                      _isSpecialCharOk = true;
                    });
                  } else {
                    setState(() {
                      _isSpecialCharOk = false;
                    });
                  }
                },
                obscureText: _obscureText,
                controller: passwordController,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm password',
                  hintText: 'Confirm password',
                  suffixIcon: IconButton(
                      onPressed: () => _togglePass(),
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility)),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please retype password';
                  }

                  if (retypePasswordController.text !=
                      passwordController.text) {
                    return 'Password does not match';
                  }

                  return null;
                },
                obscureText: _obscureText,
                controller: retypePasswordController,
                keyboardType: TextInputType.visiblePassword,
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
                      _resetPassword(passwordController.text,
                          retypePasswordController.text);
                    }
                  },
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(18.0)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.check,
                            color:
                                _isNumberOk ? Color(0xFF0A4D50) : Colors.grey,
                            size: 18,
                          ),
                          Text(
                            'Numbers',
                            style: TextStyle(
                              color:
                                  _isNumberOk ? Color(0xFF0A4D50) : Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '(123)',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w300,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.check,
                            color:
                                _isCapitalOk ? Color(0xFF0A4D50) : Colors.grey,
                            size: 18,
                          ),
                          Text(
                            'Capital letter',
                            style: TextStyle(
                              color: _isCapitalOk
                                  ? Color(0xFF0A4D50)
                                  : Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '(ABC)',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w300,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.check,
                            color: _isLowercaseOk
                                ? Color(0xFF0A4D50)
                                : Colors.grey,
                            size: 18,
                          ),
                          Text(
                            'Lowercase letter',
                            style: TextStyle(
                              color: _isLowercaseOk
                                  ? Color(0xFF0A4D50)
                                  : Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '(abc)',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w300,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.check,
                            color: _isSpecialCharOk
                                ? Color(0xFF0A4D50)
                                : Colors.grey,
                            size: 18,
                          ),
                          Text(
                            'Special character',
                            style: TextStyle(
                                color: _isSpecialCharOk
                                    ? Color(0xFF0A4D50)
                                    : Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '(@!^)',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54),
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              )
            ],
          ),
        ));
  }
}
