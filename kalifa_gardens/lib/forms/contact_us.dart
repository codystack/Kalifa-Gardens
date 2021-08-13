import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  final _formKey = GlobalKey<FormState>();
  bool _isSwitched = false;
  String _fullname, _phone, _email, _message;

  void handleSwitch(bool state) {
    setState(() {
      _isSwitched = state;
    });
    print('Current State of SWITCH IS: $state');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'I want a Kalifa Gardens agent to reach out to me',
                    textAlign: TextAlign.left,
                    softWrap: true,
                  ),
                ),
                Container(
                  width: 72,
                  color: _isSwitched ? Color(0xFF0A4D50) : Colors.grey,
                  child: Switch(
                    value: _isSwitched,
                    onChanged: (val) {
                      setState(() {
                        _isSwitched = val;
                      });
                    },
                    activeColor:  Color(0xFF0A4D50),
                    activeTrackColor:  Color(0xFF0A4D50),
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.grey,
                    activeThumbImage: AssetImage('assets/images/active_thumb.png'),
                    inactiveThumbImage: AssetImage('assets/images/inactive_thumb.png'),

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
                prefixIcon: Icon(Icons.travel_explore)
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (name) {
                _fullname = name;
              },
              keyboardType: TextInputType.name,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone number',
                  hintText: 'Phone Number',
//                    prefix: DropdownButton(
//
//                    ),
                  prefixIcon: SvgPicture.asset('assets/images/phone_naija.svg')
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                if(!RegExp('^(?:[+0]234)?[0-9]{10}').hasMatch(value)) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
              onSaved: (val) {
                _phone = val;
              },
              keyboardType: TextInputType.phone,
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
                if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onSaved: (val) {
                _email = val;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: _isSwitched ?
              <Widget>[
                Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        //All good
                      }
                      else {
//                          Validation failed
                      }
                    },
                    child: Text(
                      'Send my Details',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight:
                          FontWeight.w600
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(8.0),
                    ),
                  ),
                ),
              ]
                  :
              <Widget>[
                TextFormField(
                  minLines: 3,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your message',
                    hintText: 'Message',
                    prefixIcon: Icon(Icons.message),
//                    prefixIconConstraints: BoxConstraints()
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                  onSaved: (msg) {
                    _message = msg;
                  },
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        //All good
                      }
                      else {
//                          Validation failed
                      }
                    },
                    child: Text(
                      'Send Message',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight:
                          FontWeight.w600
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}
