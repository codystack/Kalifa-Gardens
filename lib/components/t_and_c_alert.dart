import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalifa_gardens/controller/state_controller.dart';
import 'package:kalifa_gardens/model/t_and_c_response.dart';
import 'package:kalifa_gardens/util/service.dart';

import 'shimmer_loading.dart';

class TAndCAlert extends StatefulWidget {
  const TAndCAlert({Key? key}) : super(key: key);

  @override
  _TAndCAlertState createState() => _TAndCAlertState();
}

class _TAndCAlertState extends State<TAndCAlert> {
  bool _isAccepted = false;
  String? selectedBusiness, _email, _phone;
  bool _isLoadingTerms = false, _isBizTypesLoaded = false;
  var _tandC;
  final _controller = Get.find<StateController>();

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
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.all(16.0),
      child: RichText(
        text: TextSpan(
          text: "You need to agree to ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          ),
          children: [
            TextSpan(
              text: "Kalifa Garden\'s Terms of Service",
              style: TextStyle(
                color: Color(0xFFD4B581),
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
              recognizer: TapGestureRecognizer()..onTap = _showTermsOfService,
            ),
            TextSpan(
              text: " to proceed",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
