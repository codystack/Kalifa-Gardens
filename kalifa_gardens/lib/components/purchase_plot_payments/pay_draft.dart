import 'package:demo_app/controller/state_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayBankDraft extends StatefulWidget {
  @override
  _PayBankDraftState createState() => _PayBankDraftState();
}

class _PayBankDraftState extends State<PayBankDraft> {

  final _controller = Get.find<StateController>();

  String _totalCost = '30,000,000', _accountName = "Kalifa Gardens", _accountNumber = "0123456789", _swiftCode = "2830-231";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          color: Color(0xFF0A4D50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Pay with Bank Draft',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xFFD4B581),
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'To secure your plot, you are required to pay a deposit of 25% ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  )
              ),
              SizedBox(height: 16.0,)
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(32.0),
          width: double.infinity,
          color: Color(0xFFE6E6E6),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _totalCost,
                    style: TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'NGN',
                    style: TextStyle(
                      color: Color(0xFF474747),
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 21.0,),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ACCOUNT NAME',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        _accountName,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ACCOUNT NUMBER',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        _accountNumber,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.copy),
                  )
                ],
              ),
              SizedBox(height: 16.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'SWIFT CODE',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 6.0,),
                          Icon(Icons.help_rounded, size: 14,)
                        ],
                      ),
                      Text(
                        _swiftCode,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 21.0,),
              Text(
                'Please submit a physical copy of the bank draft to this address',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 21.0,),
              Text(
                'Orange Island Projects Office, 22, Dr. Omon Ebhomenye Street, off Awudu Ekpegha Street, Lekki Phase One, Lagos, Nigeria',
                style: TextStyle(
                    color: Color(0xFF151515),
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              _controller.increment();
            },
            child: Text(
              'Payment Successful',
              style: TextStyle(
                  fontSize: 18
              ),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
                padding: const EdgeInsets.all(16.0)
            ),
          ),
        )
      ],
    );
  }
}
