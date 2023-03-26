import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../controller/state_controller.dart';
import '../screens/dashboard.dart';
import '../util/constants.dart';
import '../util/preference_manager.dart';
import '../util/service.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  var _token, _userData;
  bool _obscureText = true;
  final _controller = Get.find<StateController>();
  late PreferenceManager _manager;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void persistInfo(String token, String user) async {
    _manager.setUserProfile(user);
    _manager.saveAccessToken(token);
  }

  _togglePass() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _login(String email, String password) async {
    // print('NETWORKING $email');
    _controller.setLoading(true);

    Map _paylod = {'identifier': email, 'password': password};

    try {
      final response = await APIService().login(_paylod);

      print('STAT CODE ${response.statusCode}');
      print('RESPONSE ${jsonDecode(response.body)}');

      _controller.setLoading(false);

      if (response.statusCode == 200) {
        Map<dynamic, dynamic> loginMap = jsonDecode('${response.body}');
        print('USER  ${jsonEncode(loginMap['user'])}');

        _manager.setUserProfile("${jsonEncode(loginMap['user'])}");

        _manager.saveAccessToken(loginMap['jwt']);
        _controller.setUserData(jsonEncode(loginMap['user']));
        _manager.setIsLoggedIn(true);

        Constants.toast("Logged in successfully");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(
              manager: _manager,
            ),
          ),
        );
      } else {
        Fluttertoast.showToast(
            msg: "Operation not successful. Check credentials",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Color(0xFF0A4D50),
            textColor: Colors.white,
            fontSize: 16.0);
//      throw Exception('Failed to create album.');
      }
    } catch (e) {
      _controller.setLoading(false);
      debugPrint("On ERROR:>> ${e.toString()}");
    }
  }

  @override
  void initState() {
    super.initState();
    _manager = PreferenceManager(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email address',
                  hintText: 'Email address',
                  prefixIcon: Icon(Icons.email)),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email address';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Password',
                hintText: 'Enter Password',
                suffixIcon: IconButton(
                  onPressed: () => _togglePass(),
                  icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility),
                ),
              ),
              obscureText: _obscureText,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              controller: _passwordController,
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              width: double.infinity,
              color: Colors.black,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login(_emailController.text, _passwordController.text);
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Mulish',
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    padding: const EdgeInsets.all(10.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
