import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:money_formatter/money_formatter.dart';

import '../../controller/state_controller.dart';
import '../../util/preference_manager.dart';
import '../../util/service.dart';
import '../reject_offer_reason.dart';

// ignore: must_be_immutable
class PurchasePlotStep2 extends StatefulWidget {
  var stepIndex;
  final PreferenceManager manager;
  PurchasePlotStep2({this.stepIndex, required this.manager});

  @override
  _PurchasePlotStep2State createState() => _PurchasePlotStep2State();
}

class _PurchasePlotStep2State extends State<PurchasePlotStep2> {
  bool _isAccepted = false, _isOfferAccepted = false;
  final _controller = Get.find<StateController>();

  String _nameOfEntity = 'XYZ Corp',
      _rcNo = 'RC252414',
      _nameSublease = 'XYZ Corp Real Estate Fund',
      _addressSublease = '1, Glover Street, Ikoyi, Lagos';

  // TextEditingController _reasonController = TextEditingController();

  String _formatMoney(var amount) {
    MoneyFormatter fmf = MoneyFormatter(
      amount: amount,
      settings: MoneyFormatterSettings(
        symbol: 'N',
        thousandSeparator: ',',
        decimalSeparator: '.',
        fractionDigits: 00,
        symbolAndNumberSeparator: '',
      ),
    );

    return fmf.output.symbolOnLeft;
  }

  Future<void> _acceptOffer() async {
    _controller.triggerPurchase(true);
    try {
      final response = await APIService().acceptOffer(
        token: widget.manager.getAccessToken(),
        applicationID: "${_controller.currApplicationID.value}",
      );
      print('ACCEPT => ${response.body}');
      if (response.statusCode == 200) {
        _controller.triggerPurchase(false);
      } else {
        _controller.triggerPurchase(false);
      }
    } catch (e) {
      _controller.triggerPurchase(false);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Offer',
          textAlign: TextAlign.start,
          style: TextStyle(
            // color: Color(0xFF0A4D50),
            color: Color(0xFF0A4D50),
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 21.0,
        ),
        Obx(
          () => Container(
            child: _isOfferAccepted
                ? Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 32.0,
                        ),
                        color: Color(0x4DB2B2B2),
                        child: SvgPicture.asset(
                          'assets/images/offer_accepted_img.svg',
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Offer Accepted!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              // color: Color(0xFF0A4D50),
                              color: Color(0xFF0A4D50),
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 21.0,
                              horizontal: 32.0,
                            ),
                            child: Text(
                              'You can now proceed to secure your plot',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF4D4D4D),
                                fontSize: 19,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isAccepted
                              ? () {
                                  _controller.increment();
                                }
                              : null,
                          child: Text(
                            'Pay 25% to Secure Plot',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 356,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                        ),
                        child: Scrollbar(
                          thumbVisibility: true,
                          thickness: 10.0,
                          child: ListView(
                            padding: const EdgeInsets.all(16.0),
                            children: [
                              Text(
                                'Offer Letter',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                text: TextSpan(
                                  text:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Placerat mollis eget vulputate nunc, nec consequat risus sit id. Egestas eget laoreet molestie sed eleifend nibh. Amet ipsum pellentesque sit magna enim, neque. Consectetur lobortis aliquam ut consectetur. Nunc, et, nibh vel cum. Commodo, ultrices id laoreet urna faucibus. Lacus turpis et tristique vulputate sit pharetra.'
                                      'consequat risus sit id. Egestas eget laoreet molestie m. d Lacus turpis et tristique vulputate sit pharetra.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          'Egestas eget laoreet molestie sed eleifend nibh. Amet ipsum pellentesque sit magna enim, neque. Consectetur lobortis aliquam ut consectetur. Nunc, et, nibh vel cum. Commodo, ultrices id laoreet urna faucibus. Lacus turpis et tristique vulputate sit pharetra.'
                                          'consequat risus sit id',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          'Egestas eget laoreet molestie sed eleifend nibh. Amet ipsum pellentesque sit magna enim, neque. Consectetur lobortis aliquam ut consectetur. Nunc, et, nibh vel cum. Commodo, ultrices id laoreet urna faucibus. Lacus turpis et tristique vulputate sit pharetra.'
                                          'consequat risus sit id',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide.none,
                            right: BorderSide(color: Colors.grey, width: 1.0),
                            bottom: BorderSide(color: Colors.grey, width: 1.0),
                            left: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'NAME OF ENTITY',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '${jsonDecode(widget.manager.getUserProfile())['username']}'
                                          .capitalizeFirst!,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.edit),
                                  label: Text(''),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.black,
                                    padding: const EdgeInsets.all(8.0),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'RC NUMBER',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "$_rcNo",
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
                            SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'EMAIL ADDRESS',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '${jsonDecode(widget.manager.getUserProfile())['email']}',
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
                            SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'NAME TO APPEAR ON SUBLEASE',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "$_nameSublease",
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
                            SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ADDRESS TO APPEAR ON SUBLEASE',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "$_addressSublease",
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
                            SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PLOT SIZE',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '${_controller.selectedSize.value} SQM',
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
                            SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PLOT QUANTITY',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '${_controller.selectedQuantity.value}',
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
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(36.0),
                        color: Color(0xFFE5E5E5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TOTAL COST',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text:
                                    "${_formatMoney(_controller.totalAmount.value)}",
                                style: TextStyle(
                                  // color: Color(0xFF0A4D50),
                                  color: Color(0xFF0A4D50),
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'NGN',
                                    style: TextStyle(
                                      color: Color(0xFF5A5A5A),
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 21.0,
                            ),
                            Text(
                              'PAYMENT BREAKDOWN',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Row(
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
                            child:
                                Text('I confirm the details above are correct'),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 21.0,
                        height: 16.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        child: Container(
                                          padding: const EdgeInsets.all(16.0),
                                          height: 456,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                width: double.infinity,
                                                color: Color(0xFFE8E8E8),
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Text(
                                                  'Reason for Rejecting Offer',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF0A4D50),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 21.0,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: RejectOfferReason(
                                                  manager: widget.manager,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  'Reject Offer',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.all(16.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _isAccepted
                                    ? () {
                                        _acceptOffer();
                                      }
                                    : null,
                                child: Text(
                                  'Accept Offer',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.black,
                                  padding: const EdgeInsets.all(16.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 21,
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
