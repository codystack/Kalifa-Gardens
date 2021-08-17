import 'dart:convert';

import 'package:get/get.dart';
import 'package:kalifa_gardens/controller/state_controller.dart';

import '../model/login_response.dart';
import '../screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  var _token, _userData;
  bool _isLoading = false;
  bool _obscureText = true;
  final _controller = Get.find<StateController>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void persistInfo(String token, String user) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('token', token);
      prefs.setString('userData', user);
      prefs.setBool('loggedIn', true);
    });
  }

  _togglePass() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _login(String email, String password) async {
    // print('NETWORKING $email');
    _controller.triggerLogin(true);

    final response = await http.post(
      Uri.parse('https://api.kalifagardens.net/auth/local'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
          <String, String>{'identifier': email, 'password': password}),
    );

    print('STAT CODE ${response.statusCode}');
    print('RESPONSE ${jsonDecode(response.body)}');

    if (response.statusCode == 200) {
      // Operation was successful
      _controller.triggerLogin(false);

      Map<String, dynamic> loginMap = jsonDecode(response.body);
      var login = LoginResponse.fromJson(loginMap);
//
//      //Write token to disk
      persistInfo("${login.jwt}", "${login.user}");
      setState(() {
        _isLoading = false;
      });

      Fluttertoast.showToast(
          msg: "Logged in successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Color(0xFF0A4D50),
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
//      print('Howdy, ${user.name}!');
//      print('We sent the verification link to ${user.email}.');
    } else {
      _controller.triggerLogin(false);
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
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
  }

  Future _login2() async {
    var request = http.Request(
        'POST', Uri.parse('https://api.kalifagardens.net/auth/local'));
    request.body =
        '''{\n    "identifier": "iyiolapeter@gmail.com",\n    "password": "password"\n}''';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
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
              height: 16,
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
              height: 16,
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
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    padding: const EdgeInsets.all(16.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
