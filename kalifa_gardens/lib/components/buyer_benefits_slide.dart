import 'dart:async';
import 'package:demo_app/components/buyer_benefit_slide_item.dart';
import 'package:demo_app/components/slide_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'slide_dots.dart';

class BuyerBenefitSlide extends StatefulWidget {

  final List<String> carouselList;
  BuyerBenefitSlide(this.carouselList);

  @override
  _BuyerBenefitSlideState createState() => _BuyerBenefitSlideState();
}

class _BuyerBenefitSlideState extends State<BuyerBenefitSlide> {

  int _currentPage = 0;
  PageController _pageController =  PageController(initialPage: 0);

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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Container(
                    height: 172,
                    child: PageView.builder(
                      itemBuilder: (ctx, i) => BuyerBenefitSlideItem(index: i, carouselList: widget.carouselList),
                      itemCount: widget.carouselList.length,
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: _onPageChanged,
                    ),
                  ),
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _currentPage == 0 ? SizedBox(height: 0.0,)
                              :
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _currentPage--;
                              });
                              _pageController.animateToPage(
                                _currentPage,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                            icon: SvgPicture.asset('assets/images/prev.svg'),
                            color: Colors.white,
                            padding: const EdgeInsets.all(6.0),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Color(0x99C4C4C4),
                              borderRadius: BorderRadius.all(Radius.circular(16.0)),
                            ),
                            child: Row(
                              children: <Widget>[
                                for (int i=0; i<widget.carouselList.length; i++)
                                  if (i == _currentPage)
                                    SlideDots(true)
                                  else
                                    SlideDots(false)
                              ],
                            ),
                          ),
                          _currentPage == 3 ? SizedBox(height: 0.0,)
                              :
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _currentPage++;
                              });
                              _pageController.animateToPage(
                                _currentPage,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                            icon:  SvgPicture.asset('assets/images/next.svg'),
                            color: Colors.white,
                            padding: const EdgeInsets.all(6.0),
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
    );
  }
}
