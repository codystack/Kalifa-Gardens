// import 'dart:async';

import 'dart:convert';

import 'package:kalifa_gardens/components/quantity_controller.dart';
import 'package:kalifa_gardens/components/total_price_obs.dart';
import 'package:kalifa_gardens/model/plot_type.dart';
import 'package:kalifa_gardens/model/property_config_response.dart';
import 'package:kalifa_gardens/model/purchase_plot/register_interest.dart';
import 'package:kalifa_gardens/util/preference_manager.dart';
import 'package:kalifa_gardens/util/service.dart';

import '../../controller/state_controller.dart';
import '../../model/project_profile_slides.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../project_profile_slide_item.dart';
import '../slide_dots.dart';

import 'package:money_formatter/money_formatter.dart';

// ignore: must_be_immutable
class PurchasePlotStep1 extends StatefulWidget {
  var stepIndex;
  final PreferenceManager manager;
  PurchasePlotStep1({required this.stepIndex, required this.manager});

  @override
  _PurchasePlotStep1State createState() => _PurchasePlotStep1State();
}

class _PurchasePlotStep1State extends State<PurchasePlotStep1> {
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  bool _isAccepted = false;
  final _controller = Get.find<StateController>();

  String selectedPlotSize = 'Select plot size';
  double purchasePrice = 0.0;
  var _selectedSize;
  double _totalPrice = 0.0;
  int _quantity = 1;

  double _unitPrice = 0.0;
  List<PlotType> _plotType = [];

  double _parseAmount(dynamic dAmount) {
    double returnAmount = 0.00;
    String strAmount;

    try {
      if (dAmount == null || dAmount == 0) return 0.0;

      strAmount = dAmount.toString();

      if (strAmount.contains('.')) {
        returnAmount = double.parse(strAmount);
      } else {
        //Add dot
        String addDot = strAmount + ".00";
        returnAmount = double.parse(addDot);
      }
    } catch (e) {
      return 0.000;
    }

    return returnAmount;
  }

  Future<void> getPropertyConfig() async {
    final response = await APIService().getPropertyConfig();

    print('PROPERTY RESP: ${jsonDecode(response.body)}');

    if (response.statusCode == 200) {
      Map<String, dynamic> propertyMap = jsonDecode(response.body);
      var property = PropertyConfig.fromJson(propertyMap);
      // _controller.setUnitPrice(property.unitPrice);
      setState(() {
        _unitPrice = _parseAmount(property.unitPrice);
        _plotType = property.plotTypes;
      });
      print('UNIT PRICE IS $_unitPrice');
    } else {}
  }

  @override
  void initState() {
    super.initState();
    getPropertyConfig();
    // _startApplication();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  String _formatMoney(var amount) {
    MoneyFormatter fmf = MoneyFormatter(
        amount: amount,
        settings: MoneyFormatterSettings(
            symbol: 'N',
            thousandSeparator: ',',
            decimalSeparator: '.',
            fractionDigits: 00,
            symbolAndNumberSeparator: ''));

    return fmf.output.symbolOnLeft;
  }

  Future<void> _startApplication() async {
    _controller.triggerPurchase(true);
    Map _body = {"size": _selectedSize, "qty": _quantity};
    final response = await APIService().startApplication(
      data: _body,
      token: widget.manager.getAccessToken(),
    );
    print('START RESP => ${response.body}');
    if (response.statusCode == 200) {
      Map<String, dynamic> interestMap = jsonDecode('${response.body}');
      var interest = RegisterInterestModel.fromJson(interestMap);

      print('SYZE  => ${interest.id}');
      _controller.setCurrApplicationID(interest.id);
      _controller.setSelectedPlotSize(interest.size);
      _controller.setSelectedQuantity(interest.qty);
      _controller.setTotalAmount(_totalPrice);

      Future.delayed(Duration(seconds: 3), () {
        _controller.triggerPurchase(false);
        setState(() {
          _controller.increment();
        });
      });
    } else {
      _controller.triggerPurchase(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_unitPrice > 0.0 && _selectedSize != null) {
      setState(() {
        _totalPrice = _unitPrice * _selectedSize * _quantity;
      });
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Register Interest',
          textAlign: TextAlign.start,
          style: TextStyle(
              // color: Color(0xFF0A4D50),
              color: Color(0xFF0A4D50),
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
        SizedBox(
          height: 18.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                Container(
                  height: 260,
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: PageView.builder(
                    itemBuilder: (ctx, i) => ProjectProfileSlideItem(i),
                    itemCount: projSlideList.length,
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: _onPageChanged,
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Color(0x99000000),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                          ),
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: <Widget>[
                              for (int i = 0; i < projSlideList.length; i++)
                                if (i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )),
          ],
        ),
        Container(
          color: Colors.black54,
          height: 2.0,
          width: double.infinity,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Price per SQM',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 10.0,
                ),
                _unitPrice == 0.0
                    ? SizedBox()
                    : Text(
                        '${_unitPrice == 0.0 ? 0.0 : _formatMoney(_unitPrice)}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.help_rounded,
                color: Colors.black54,
                size: 14.0,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Size of plot',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.help_rounded,
                          color: Colors.black54,
                          size: 14.0,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black54,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: DropdownButton(
                      hint: Text(
                        selectedPlotSize,
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      items: _plotType.map((val) {
                        return DropdownMenuItem(
                          value: val.title,
                          child: Text(val.title),
                        );
                      }).toList(),
                      // value: 'Select plot size',
                      onChanged: (newValue) {
                        setState(() {
                          selectedPlotSize = newValue as String;
                          List<PlotType> s = _plotType
                              .where((element) => element.title == newValue)
                              .toList();
                          _selectedSize = s[0].size;
                        });

                        //             // setState(() {
                        //             //   purchasePrice = calculatePurchase();
                        //             // });

                        //             // // _controller.setTotalPrice(widget.unitPrice,
                        //             //     _selectedSize, _controller.quantityCounter);
                      },
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 28,
                      underline: SizedBox(),
                      isExpanded: true,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Quantity',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.help_rounded,
                          color: Colors.black54,
                          size: 14.0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.8, horizontal: 16.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black54,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '$_quantity',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 21.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _quantity += 1;
                                });
                              },
                              child: Icon(
                                Icons.arrow_drop_up,
                                size: 15.0,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_quantity > 1) {
                                  setState(() {
                                    _quantity--;
                                  });
                                } else {
                                  setState(() {
                                    _quantity = 1;
                                  });
                                }
                              },
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 15.0,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
        selectedPlotSize != 'Select plot size'
            ? TotalPriceObs(
                totalPrice: _totalPrice,
                selectedPlotSize: _selectedSize,
                formatMoney: _formatMoney(_totalPrice),
              )
            : SizedBox(height: 21.0),
        SizedBox(
          width: 10.0,
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
              // activeColor: Color(0xFF0A4D50),
              activeColor: Color(0xFF0A4D50),
            ),
            Expanded(
              child: Text('I confirm the details above are correct'),
            ),
          ],
        ),
        SizedBox(
          width: 21.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
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
                  onPressed:
                      _isAccepted && selectedPlotSize != 'Select plot size'
                          ? () {
                              _startApplication();
                            }
                          : null,
                  child: Text(
                    'Proceed',
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
            ),
          ],
        )
      ],
    );
  }
}
