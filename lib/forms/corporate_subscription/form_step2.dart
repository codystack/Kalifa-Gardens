import '../../controller/state_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FormStep2 extends StatefulWidget {
  @override
  _FormStep2State createState() => _FormStep2State();
}

class _FormStep2State extends State<FormStep2> {
  final _formKey = GlobalKey<FormState>();
  bool _isAccepted = false;
  final _controller = Get.find<StateController>();

  String? _fullname, _designation, _phone, _mailingAddr, _emailAddr;

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
                              // color: Color(0xFF0A4D50),
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
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Placerat mollis eget vulputate nunc, nec consequat risus sit id. Egestas eget laoreet molestie sed eleifend nibh. Amet ipsum pellentesque sit magna enim, neque. Consectetur lobortis aliquam ut consectetur. Nunc, et, nibh vel cum. Commodo, ultrices id laoreet urna faucibus. Lacus turpis et tristique vulputate sit pharetra. '
                                    'consequat risus sit id. Egestas eget laoreet molestie sed eleifend nibh. Amet ipsum pellentesque sit magna enim, neque. Consectetur lobortis aliquam ut consectetur. Nunc, et, nibh vel cum. Commodo, ultrices id laoreet urna faucibus. Lacus turpis et tristique vulputate sit pharetra.'
                                    'consequat risus sit id. Egestas eget laoreet molestie m. d Lacus turpis et tristique vulputate sit pharetra.',
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
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Color(0xFFE8E8E8),
            child: Text(
              'Authorized Contact Details',
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
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Full Name',
              hintText: 'Full Name',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Full name is required';
              }
              return null;
            },
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.name,
            onSaved: (val) {
              _fullname = val;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Designation',
              hintText: 'Designation',
              suffixIcon: Icon(Icons.search),
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Designation is required';
              }
              return null;
            },
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.text,
            onSaved: (val) {
              _designation = val;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
                hintText: 'Phone Number',
//                    prefix: DropdownButton(
//
//                    ),
                prefixIcon: SvgPicture.asset('assets/images/phone_naija.svg')),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Next of Kin phone number is required';
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
              labelText: 'Email Address',
              hintText: 'Email Address',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
//            if (value == null || value.isEmpty) {
//              return 'Next of Kin email is required';
//            }
              if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]')
                  .hasMatch(value!)) {
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
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.streetAddress,
            onSaved: (val) {
              _mailingAddr = val;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                value: _isAccepted,
                onChanged: (state) {
                  setState(() {
                    _isAccepted = state!;
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
                          // color: Color(0xFF0A4D50),
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
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isAccepted
                  ? () {
                      if (_formKey.currentState!.validate()) {
                        //All good
                        _controller.incrementCorporateSub();
                      }
                    }
                  : null,
              child: Text(
                'Submit',
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
