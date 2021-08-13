import 'package:demo_app/controller/state_controller.dart';
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

  String _entityName, _rcNumber, _officeAddr, _typeofBusiness, _mobilePhoneNo, _emailAddr, _websiteURL, _mailingAddr, _nameSublease, _addrSublease;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.incrementIndividualSub();
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
              'Corporate Buyer Registration',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'The details you enter below will go in your offer letter. Please be sure to check that the information entered is valid.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black54,
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
              labelText: 'Name of Entity',
              hintText: 'Name of Entity',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name of entity is required';
              }
              return null;
            },
            keyboardType: TextInputType.name,
            onSaved: (val) {
              _entityName = val;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'RC Number',
              hintText: 'RC Number',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'RC Number is required';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            onSaved: (val) {
              _rcNumber = val;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Office Address',
              hintText: 'Office Address',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Office address is required';
              }
              return null;
            },
            keyboardType: TextInputType.streetAddress,
            onSaved: (val) {
              _officeAddr = val;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Type of Business',
                hintText: 'Type of Business',
                suffixIcon: Icon(Icons.search)
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Type of Business is required';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            onSaved: (val) {
              _typeofBusiness = val;
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
              _mobilePhoneNo = val;
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
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Website URL',
              hintText: 'Website URL',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Website URL is required';
              }
              return null;
            },
            keyboardType: TextInputType.url,
            onSaved: (val) {
              _websiteURL = val;
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
                return 'Mailing Address is required';
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
          SizedBox(height: 16.0,),
          Container(
            width: double.infinity,
            color: Colors.black,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Next',
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
                padding: const EdgeInsets.all(10.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
