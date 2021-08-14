import '../../controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FormStep1 extends StatefulWidget {
  @override
  _FormStep1State createState() => _FormStep1State();
}

class _FormStep1State extends State<FormStep1> {
  final _formKey = GlobalKey<FormState>();
  var _gender = 'Male';
  bool _isAccepted = false;
  final _controller = Get.find<StateController>();

  String? _surname,
      _othernames,
      _residentialAddr,
      _mailingAddr,
      _nationality,
      _stateOfOrigin,
      _phone,
      _homePhone,
      _emailAddr,
      _nameSublease,
      _addrSublease;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _controller.incrementIndividualSub();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Color(0xFFE8E8E8),
            child: Text(
              'Individual Buyer Registration',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: Text(
              'The details you enter below will go in your offer letter. Please be sure to check that the information entered is valid.',
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Surname',
              hintText: 'Surname',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your surname';
              }
              return null;
            },
            keyboardType: TextInputType.name,
            onSaved: (val) {
              _surname = val;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Other Names',
              hintText: 'Other Names',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            keyboardType: TextInputType.name,
            onSaved: (val) {
              _othernames = val;
            },
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  decoration: BoxDecoration(
                    color: _gender == 'Male' ? Color(0xFF0A4D50) : Colors.white,
                    border: Border.all(
                        color:
                            _gender == 'Male' ? Color(0xFF0A4D50) : Colors.grey,
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
                      primary:
                          _gender == 'Male' ? Color(0xFF0A4D50) : Colors.white,
                      onPrimary:
                          _gender == 'Male' ? Color(0xFF0A4D50) : Colors.grey,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(14.0),
                      width: double.infinity,
                      child: Text(
                        'Male',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _gender == 'Male'
                              ? Colors.white
                              : Color(0xFF0A4D50),
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
                    color:
                        _gender == 'Female' ? Color(0xFF0A4D50) : Colors.white,
                    border: Border.all(
                        color: _gender == 'Female'
                            ? Color(0xFF0A4D50)
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
                          ? Color(0xFF0A4D50)
                          : Colors.white,
                      onPrimary:
                          _gender == 'Female' ? Color(0xFF0A4D50) : Colors.grey,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(14.0),
                      width: double.infinity,
                      child: Text(
                        'Female',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _gender == 'Female'
                              ? Colors.white
                              : Color(0xFF0A4D50),
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Residential Address',
              hintText: 'Residential Address',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Residential address is required';
              }
              return null;
            },
            keyboardType: TextInputType.streetAddress,
            onSaved: (val) {
              _residentialAddr = val;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Mailing Address',
              hintText: 'Mailing Address',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mailing address is required';
              }
              return null;
            },
            keyboardType: TextInputType.streetAddress,
            onSaved: (val) {
              _mailingAddr = val;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nationality',
              hintText: 'Nationality',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nationality is required';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            onSaved: (val) {
              _nationality = val;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'State of Origin',
              hintText: 'State of Origin',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'State of Origin is required';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            onSaved: (val) {
              _stateOfOrigin = val;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mobile Phone Number',
                hintText: 'Mobile Phone Number',
//                    prefix: DropdownButton(
//
//                    ),
                prefixIcon: SvgPicture.asset('assets/images/phone_naija.svg')),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              if (!RegExp('^(?:[+0]234)?[0-9]{10}').hasMatch(value)) {
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
                labelText: 'Home Phone Number',
                hintText: 'Home Phone Number',
//                    prefix: DropdownButton(
//
//                    ),
                prefixIcon: SvgPicture.asset('assets/images/phone_naija.svg')),
            // The validator receives the text that the user has entered.
            validator: (value) {
//                  if (value == null || value.isEmpty) {
//                    return 'Please enter your phone number';
//                  }
              if (!RegExp('^(?:[+0]234)?[0-9]{10}').hasMatch(value!)) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
            onSaved: (val) {
              _homePhone = val;
            },
            keyboardType: TextInputType.phone,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email Address',
              hintText: 'Email Address',
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
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name to appear on Sublease',
              hintText: 'Name to appear on Sublease',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name on Sublease is required';
              }
              return null;
            },
            keyboardType: TextInputType.name,
            onSaved: (val) {
              _nameSublease = val;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Address on Sublease',
              hintText: 'Address to appear on Sublease',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Address on Sublease is required';
              }
              return null;
            },
            keyboardType: TextInputType.streetAddress,
            onSaved: (val) {
              _addrSublease = val;
            },
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
                  //All good
                  _controller.incrementIndividualSub();
                }
              },
              child: Text(
                'Next',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                padding: const EdgeInsets.all(16.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
