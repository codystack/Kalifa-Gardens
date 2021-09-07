import 'package:country_code_picker/country_code_picker.dart';

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

  TextEditingController _surnameController = TextEditingController();
  TextEditingController _othernamesController = TextEditingController();
  TextEditingController _residentialAddrController = TextEditingController();
  TextEditingController _mailingAddrController = TextEditingController();
  TextEditingController _nationalityController = TextEditingController();
  TextEditingController _stateOfOriginController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _homePhoneController = TextEditingController();
  TextEditingController _emailAddrController = TextEditingController();
  TextEditingController _nameSubleaseController = TextEditingController();
  TextEditingController _addrSubleaseController = TextEditingController();

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
            controller: _surnameController,
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
            controller: _othernamesController,
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
            controller: _residentialAddrController,
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
            controller: _mailingAddrController,
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
            controller: _nationalityController,
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
            controller: _stateOfOriginController,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Phone Number',
              prefixIcon: CountryCodePicker(
                alignLeft: false,
                onChanged: (val) {},
                flagWidth: 22.5,
                initialSelection: 'NG',
                favorite: ['+234', 'NG'],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
              ),
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
              hintText: 'Home Phone Number',
              prefixIcon: CountryCodePicker(
                alignLeft: false,
                onChanged: (val) {},
                flagWidth: 22.5,
                initialSelection: 'NG',
                favorite: ['+234', 'NG'],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
              ),
            ),
            // The validator receives the text that the user has entered.                    prefixIcon: ImageIcon(Image.asset()),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your home phone number';
              }
              if (!RegExp('^(?:[+0]234)?[0-9]{10}').hasMatch(value)) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
            keyboardType: TextInputType.phone,
            controller: _homePhoneController,
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
            controller: _emailAddrController,
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
            controller: _nameSubleaseController,
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
            controller: _addrSubleaseController,
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
