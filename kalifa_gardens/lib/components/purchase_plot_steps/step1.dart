import 'dart:async';

import 'package:demo_app/controller/state_controller.dart';
import 'package:demo_app/model/project_profile_slides.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../project_profile_slide_item.dart';
import '../slide_dots.dart';

// ignore: must_be_immutable
class PurchasePlotStep1 extends StatefulWidget {

  var stepIndex;
  PurchasePlotStep1({this.stepIndex});

  @override
  _PurchasePlotStep1State createState() => _PurchasePlotStep1State();
}

class _PurchasePlotStep1State extends State<PurchasePlotStep1> {

  int _currentPage = 0;
  PageController _pageController =  PageController(initialPage: 0);
  bool _isAccepted = false;
  final _controller = Get.find<StateController>();

  String selectedPlotSize = '600SQM';
  List plotSizes = [
    '600SQM',
    '1000SQM',
    '2000SQM',
    '5000SQM',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if(_currentPage < 3) {
        _currentPage++;
      }
      else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Register Interest',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Color(0xFF0A4D50),
            fontWeight: FontWeight.w700,
            fontSize: 20
          ),
        ),
        SizedBox(height: 21.0,),
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
                                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                              ),
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                children: <Widget>[
                                  for (int i=0; i<projSlideList.length; i++)
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
                )
            ),
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
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(width: 10.0,),
                Text(
                  'N30,000',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.help_rounded, color: Colors.black54, size: 14.0),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
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
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.help_rounded, color: Colors.black54, size: 14.0),
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54, width: 1.0, style: BorderStyle.solid)
                    ),
                    child: DropdownButton(
                      hint: Text('Size of plot size'),
                      items: plotSizes.map((val) {
                        return DropdownMenuItem(
                          value: val,
                          child: Text(val),
                        );
                      }).toList(),
                      value: selectedPlotSize,
                      onChanged: (newValue) {
                        setState(() {
                          selectedPlotSize = newValue;
                        });
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
            SizedBox(width: 10.0,),
            Column(
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
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.help_rounded, color: Colors.black54, size: 14.0),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54, width: 1.0, style: BorderStyle.solid)
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 16.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                  text: 'Purchase $selectedPlotSize for ',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  children: [
                    TextSpan(
                      text: '6,0000,000',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: 'NGN',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    )
                  ]
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(width: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Checkbox(value: _isAccepted, onChanged: (state) {
              setState(() {
                _isAccepted = state;
              });
            }, activeColor: Color(0xFF0A4D50),),
            Expanded(
              child: Text(
                  'I confirm the details above are correct'
              ),
            ),
          ],
        ),
        SizedBox(width: 21.0,),
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
                        fontWeight:
                        FontWeight.w600
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    padding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0,),
            Expanded(
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isAccepted ? () {
                    setState(() {
                     _controller.increment();
                    });
                  }
                  :
                  null,
                  child: Text(
                    'Proceed',
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
              ),
            ),
          ],
        )
      ],
    );
  }
}