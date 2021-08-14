import '../forms/login_form.dart';
import '../screens/account_type_registration.dart';
import '../screens/forgot_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 32.0),
            color: Color(0xFF0A4D50),
            child: Center(
              child: SvgPicture.asset('assets/images/logo_image.svg'),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(16.0),
            color: Color(0xFFD4B581),
            child: Center(
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 21.0,
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
                padding: const EdgeInsets.all(6.0),
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey, width: 1.0, style: BorderStyle.solid),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () => {},
                    child: SvgPicture.asset('assets/images/google_icon.svg'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6.0),
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey, width: 1.0, style: BorderStyle.solid),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () => {},
                    child: SvgPicture.asset('assets/images/facebook_icon.svg'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6.0),
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey, width: 1.0, style: BorderStyle.solid),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () => {},
                    child: SvgPicture.asset('assets/images/microsoft_icon.svg'),
                  ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
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
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
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
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color: Colors.black54),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
