import '../screens/Login.dart';
import '../screens/corporate_registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'individual_registration.dart';

class AccountTypeRegistration extends StatefulWidget {
  @override
  _AccountTypeRegistrationState createState() =>
      _AccountTypeRegistrationState();
}

class _AccountTypeRegistrationState extends State<AccountTypeRegistration> {
  List<String>? paramList;

  bool _isIndividual = true;
  bool _isCorporate = false;

  @override
  void initState() {
    // TODO: implement initState
//    paramList.add(widget.actionType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                left: 24.0, right: 24.0, bottom: 32.0, top: 16.0),
            color: Color(0xFF0A4D50),
            child: Center(
              child: SvgPicture.asset('assets/images/logo_image.svg'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  color: Color(0xFFE8E8E8),
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Select Account Type',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        fontFamily: 'Mulish'),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topRight,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0x3B0A4D50),
                                  border: Border.all(
                                      color: Color(0xFF0A4D50),
                                      width: 1.0,
                                      style: BorderStyle.solid),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24.0))),
                              child: Center(
                                child: Icon(Icons.person),
                              ),
                              padding: const EdgeInsets.all(6.0),
                            ),
                            Text(
                              'Individual Buyer',
                              style: TextStyle(
                                color: Color(0xFF434343),
                                fontSize: 21.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Mulish',
                              ),
                            ),
                            Checkbox(
                              value: _isIndividual,
                              onChanged: (state) {
                                setState(() {
                                  _isIndividual = state as bool;
                                  _isCorporate = !state as bool;
                                });
                              },
                              activeColor: Color(0xFF0A4D50),
                              checkColor: Color(0xFFFFFFFF),
                              focusColor: Color(0xFF0A4D50),
                            )
                          ],
                        ),
                        Positioned(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.help_rounded,
                                color: Colors.black, size: 18),
                          ),
                          top: -24,
                          right: -18,
                        )
                      ],
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                            style: BorderStyle.solid)),
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topRight,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Center(
                                child: SvgPicture.asset(
                                    'assets/images/corporate_icon.svg'),
                              ),
                            ),
                            Text(
                              'Corporate Buyer',
                              style: TextStyle(
                                  color: Color(0xFF434343),
                                  fontSize: 21.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Mulish'),
                            ),
                            Checkbox(
                              value: _isCorporate,
                              onChanged: (state) {
                                setState(() {
                                  _isCorporate = state as bool;
                                  _isIndividual = !state as bool;
                                });
                              },
                              activeColor: Color(0xFF0A4D50),
                              checkColor: Color(0xFFFFFFFF),
                              focusColor: Color(0xFF0A4D50),
                            )
                          ],
                        ),
                        Positioned(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.help_rounded,
                                color: Colors.black, size: 18),
                          ),
                          top: -24,
                          right: -18,
                        )
                      ],
                    )),
                SizedBox(
                  height: 21.0,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.black,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_isCorporate) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CorporateRegistration()),
                        );
                      } else if (_isIndividual) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IndividualRegistration()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                    ),
                    child: Text(
                      'Proceed',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 21.0,
                          fontFamily: 'Mulish'),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 12.0),
                  child: Center(
                    child: Text(
                      'All information will be treated with utmost confidentiality',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
