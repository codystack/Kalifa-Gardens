import 'dart:convert';

import '../components/shimmer_loading.dart';
import '../model/otp_response.dart';
import '../model/t_and_c_response.dart';
import '../screens/verification.dart';
import '../util/service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class IndividualForm extends StatefulWidget {
  @override
  _IndividualFormState createState() => _IndividualFormState();
}

class _IndividualFormState extends State<IndividualForm> {
  final _formKey = GlobalKey<FormState>();
  var _gender = 'Male', _tandC;
  bool _isAccepted = false, _isLoadingTerms = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _getTandC() async {
    setState(() {
      _isLoadingTerms = true;
    });
    final response = await APIService().getTandC();

    print('STAT CODE ${response.statusCode}');
    print('RESPONSE ${jsonDecode(response.body)}');

    if (response.statusCode == 200) {
      // Operation was successful
      Map<String, dynamic> respMap = jsonDecode(response.body);
      var terms = TermsAndConditions.fromJson(respMap);

      setState(() {
        _isLoadingTerms = false;
        _tandC = terms.content;
      });

//      print('Howdy, ${user.name}!');
//      print('We sent the verification link to ${user.email}.');
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.

      throw Exception('Failed to get terms and conditions.');
    }
  }

  Future<void> _createOtp(String email, String type) async {
    final response = await APIService().createOTP(email, type);

    print('Create RESP: ${jsonDecode(response.body)}');
    if (response.statusCode == 200) {
      //All good now route to create otp screen
      Map<String, dynamic> otpMap = jsonDecode(response.body);
      var otp = OTPResponse.fromJson(otpMap);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Verification(
            fullname: _nameController.text,
            phone: _phoneController.text,
            email: _emailController.text,
            gender: _gender,
            isAccepted: _isAccepted,
            otpID: otp.id,
            accountType: "individual",
          ),
        ),
      );
    } else {
      //Not successful. Show toast
      Fluttertoast.showToast(
          msg: "Operation not successful. Try again",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF0A4D50),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  void initState() {
    super.initState();
    _getTandC();
  }

  Widget _buildShimmer() {
    return ShimmerLoading(
      isLoading: _isLoadingTerms,
      child: Column(children: [
        for (var i = 0; i < 6; i++)
          Container(
            width: double.infinity,
            height: 18.0,
            color: Colors.grey[300],
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
                Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          )
      ]),
    );
  }

  Future _showTermsOfService() async {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topRight,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 430,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        color: Color(0xFFE8E8E8),
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            'To proceed, you have to agree to Kalifa Gardens terms and conditions',
                            style: TextStyle(
                              color: Color(0xFF0A4D50),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: Card(
                          elevation: 2.0,
                          margin: const EdgeInsets.all(0.0),
                          child: Scrollbar(
                            isAlwaysShown: true,
                            thickness: 10.0,
                            child: ListView(
                              padding: const EdgeInsets.all(10.0),
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Text(
                                    'Terms of Service',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: _isLoadingTerms
                                      ? _buildShimmer()
                                      : Text(
                                          _tandC,
                                          style: TextStyle(
                                            color: Colors.black54,
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.black,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'I Agree',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.all(8.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  child: Container(
                    child: IconButton(
                      onPressed: () {
//                                                  _dialogKey.currentState.
                      },
                      icon: Icon(Icons.close),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        color: Colors.white),
                  ),
                  top: -60,
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Individual Buyer Registration',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full name',
                    hintText: 'Full Name',
                    prefixIcon: Icon(Icons.card_travel)),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.name,
                controller: _nameController,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone number',
                  hintText: 'Phone Number',
//                    prefixIcon: ImageIcon(Image.asset('assets/images/phone_naija.svg'), ),
                ),
                // The validator receives the text that the user has entered.                    prefixIcon: ImageIcon(Image.asset()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!RegExp('^(?:[+0]234)?[0-9]{10}').hasMatch(value)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                controller: _phoneController,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email address',
                  hintText: 'Email Address',
                  prefixIcon: Icon(Icons.email),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      decoration: BoxDecoration(
                        color: _gender == 'Male'
                            ? Color(0xFFD4B581)
                            : Colors.white,
                        border: Border.all(
                            color: _gender == 'Male'
                                ? Color(0xFFD4B581)
                                : Colors.grey,
                            width: 1.0,
                            style: BorderStyle.solid),
                      ),
                      child: ElevatedButton(
                        onPressed: () => {
                          setState(() {
                            _gender = 'Male';
                          })
                        },
                        style: ElevatedButton.styleFrom(
                          primary: _gender == 'Male'
                              ? Color(0xFFD4B581)
                              : Colors.white,
                          onPrimary: _gender == 'Male'
                              ? Color(0xFFD4B581)
                              : Colors.grey,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(14.0),
                          width: double.infinity,
                          child: Text(
                            'Male',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _gender == 'Male'
                                  ? Colors.black
                                  : Colors.black54,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 5.0),
                      decoration: BoxDecoration(
                        color: _gender == 'Female'
                            ? Color(0xFFD4B581)
                            : Colors.white,
                        border: Border.all(
                            color: _gender == 'Female'
                                ? Color(0xFFD4B581)
                                : Colors.grey,
                            width: 1.0,
                            style: BorderStyle.solid),
                      ),
                      child: ElevatedButton(
                        onPressed: () => {
                          setState(() {
                            _gender = 'Female';
                          })
                        },
                        style: ElevatedButton.styleFrom(
                          primary: _gender == 'Female'
                              ? Color(0xFFD4B581)
                              : Colors.white,
                          onPrimary: _gender == 'Female'
                              ? Color(0xFFD4B581)
                              : Colors.grey,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(14.0),
                          width: double.infinity,
                          child: Text(
                            'Female',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _gender == 'Female'
                                  ? Colors.black
                                  : Colors.black54,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: _isAccepted,
                      onChanged: (state) {
                        setState(() {
                          _isAccepted = state as bool;
                        });
                      },
                      activeColor: Color(0xFF0A4D50),
                    ),
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                              text: "I agree to ",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                              children: [
                            TextSpan(
                              text: "Kalifa Garden\'s Terms of Service",
                              style: TextStyle(
                                color: Color(0xFF0A4D50),
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = _showTermsOfService,
                            )
                          ])),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.black,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _isAccepted) {
                      _createOtp(_emailController.text, "registration");
                    }
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
