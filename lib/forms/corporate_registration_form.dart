import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kalifa_gardens/controller/state_controller.dart';
import 'package:kalifa_gardens/model/otp_response.dart';
import 'package:kalifa_gardens/screens/verification.dart';

import '../../components/shimmer_loading.dart';
import '../../model/business_types_response.dart';
import '../../model/t_and_c_response.dart';
import '../../util/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CorporateForm extends StatefulWidget {
  @override
  _CorporateFormState createState() => _CorporateFormState();
}

class _CorporateFormState extends State<CorporateForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isAccepted = false;
  String? selectedBusiness, _email, _phone, bizId;
  bool _isLoadingTerms = false, _isBizTypesLoaded = false;
  var _tandC;
  List<BusinessTypesResponse> businessList = [];
  final _controller = Get.find<StateController>();
  bool _isSelected = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();

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

      throw Exception('Failed to create album.');
    }
  }

  Future<void> _getBizTypes() async {
    setState(() {
      _isLoadingTerms = true;
    });
    final response = await APIService().getBusinessType();

    print('STAT CODE ${response.statusCode}');
    print('BIZ RESP ${jsonDecode(response.body)}');

    if (response.statusCode == 200) {
      // Operation was successful
      print('OPERATION SUCCESSFUL');
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      setState(() {
        businessList = parsed
            .map<BusinessTypesResponse>(
                (json) => BusinessTypesResponse.fromJson(json))
            .toList();
        _isBizTypesLoaded = true;
      });
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.

      throw Exception('Failed to get business types.');
    }
  }

  Future<void> _createOtp(String email, String type) async {
    final response = await APIService().createOTP(email, type);

    print('Create RESP: ${jsonDecode(response.body)}');
    if (response.statusCode == 200) {
      //All good now route to create otp screen
      Map<String, dynamic> otpMap = jsonDecode(response.body);
      var otp = OTPResponse.fromJson(otpMap);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Verification(
            bizName: _nameController.text,
            bizType: bizId,
            phone: _phoneController.text,
            email: _emailController.text,
            website: _websiteController.text,
            isAccepted: _isAccepted,
            otpID: otp.id,
            accountType: "corporate",
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
    _getBizTypes();
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

  void _onCountryChange(CountryCode countryCode) {
    //TODO : manipulate the selected country code here
    print("New Country selected: " + countryCode.toString());
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
                    'Corporate Buyer Registration',
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
                    labelText: 'Name of Entity',
                    hintText: 'Name of Entity',
                    prefixIcon: Icon(Icons.card_travel)),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter business name';
                  }
                  return null;
                },
                controller: _nameController,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: _isSelected ? Colors.grey : Colors.redAccent,
                        width: 1.0,
                        style: BorderStyle.solid)),
                child: DropdownButton(
                  hint: _isSelected
                      ? Text('Type of Business')
                      : Text(
                          'Select business type',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                  items: businessList.map((e) {
                    return DropdownMenuItem(
                      value: _isBizTypesLoaded ? e.name : 'Please wait...',
                      child:
                          Text(_isBizTypesLoaded ? e.name! : 'Please wait...'),
                    );
                  }).toList(),
                  value: selectedBusiness,
                  onChanged: (newValue) {
                    setState(() {
                      selectedBusiness = newValue as String?;
                      List<BusinessTypesResponse> s = businessList
                          .where((element) => element.name == newValue)
                          .toList();
                      bizId = s[0].id;
                    });
                  },
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                  iconSize: 34,
                  isExpanded: true,
                  underline: SizedBox(),
                ),
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
                    onChanged: _onCountryChange,
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
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Website',
                  hintText: 'Website',
                  prefixIcon: Icon(Icons.public),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your website';
                  }
                  if (!RegExp(r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?",
                              caseSensitive: false)
                          .hasMatch(value) &&
                      !RegExp(r"^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}$")
                          .hasMatch(value)) {
                    return 'Please enter a valid url';
                  }
                  return null;
                },
                keyboardType: TextInputType.url,
                controller: _websiteController,
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
                        _controller.verifyAccepted(state!);
                        setState(() {
                          _isAccepted = state;
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
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.black,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_isAccepted == false) {
                        _controller.verifyAccepted(_isAccepted);
                      } else {
                        _controller.verifyAccepted(true);
                        _createOtp(_emailController.text, "registration");
                      }
                    } else {
                      if (_isAccepted == false) {
                        _controller.verifyAccepted(_isAccepted);
                      } else {
                        _controller.verifyAccepted(true);
                      }
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
                    padding: const EdgeInsets.all(16.0),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
