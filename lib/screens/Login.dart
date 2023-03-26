import 'package:get/get.dart';
import 'package:kalifa_gardens/components/loader/overlay_loader.dart';
import 'package:kalifa_gardens/controller/state_controller.dart';
import 'package:kalifa_gardens/util/constants.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../forms/login_form.dart';
import '../screens/account_type_registration.dart';
import '../screens/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _controller = Get.find<StateController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlayPro(
        isLoading: _controller.isLoading.value,
        backgroundColor: Colors.black45,
        progressIndicator: const CircularProgressIndicator.adaptive(),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
          ),
          body: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  bottom: 32.0,
                ),
                // color: Color(0xFF0A4D50),
                color: Color(0xFF0A4D50),
                child: Center(
                  child:
                      SvgPicture.asset('assets/images/account_type_logo.svg'),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14.0),
                margin: const EdgeInsets.all(16.0),
                color: Color(0xFFD4B581),
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0,
                      fontFamily: 'Mulish',
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: LoginForm(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(4.0),
                    height: MediaQuery.of(context).size.height * 0.10,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () => {},
                        child: SvgPicture.asset(
                          'assets/images/google_icon.svg',
                          fit: BoxFit.cover,
                          height: 28,
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4.0),
                    height: MediaQuery.of(context).size.height * 0.10,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () => {},
                        child: SvgPicture.asset(
                          'assets/images/facebook_icon.svg',
                          fit: BoxFit.cover,
                          height: 28,
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () => {},
                        child: SvgPicture.asset(
                          'assets/images/microsoft_icon.svg',
                          fit: BoxFit.cover,
                          height: 28,
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountTypeRegistration(),
                        ),
                      );
                    },
                    child: Text(
                      'Create an account instead',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Mulish',
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPassword(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Mulish',
                        fontSize: 17.0,
                      ),
                    ),
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
