import 'package:kalifa_gardens/util/preference_manager.dart';

import '../components/custom_drawer.dart';
import '../components/slide_dots.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../components/expandable_buttons.dart';
import '../components/slide_item.dart';
import '../model/onbarding_slides.dart';
import 'package:flutter_svg/svg.dart';

class Onboarding extends StatefulWidget {
  final PreferenceManager manager;
  const Onboarding({Key? key, required this.manager}) : super(key: key);
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  int _currentPage = 0;
  PageController? _pageController = PageController(initialPage: 0);
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController!.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // print ('SCREEN HEIGHT $screenHeight');

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/kalifa_gardens.svg'),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Image.asset(
                'assets/images/app_icon.png',
                width: 40.0,
                height: 40.0,
              ),
            ),
          ],
        ),
        actions: widget.manager.getIsLoggedIn()
            ? [
                IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.notifications),
                ),
                IconButton(
                  onPressed: () {
                    if (_drawerscaffoldkey.currentState!.isEndDrawerOpen) {
                      _animationController!.reverse();
                      Navigator.pop(context);
                    } else {
                      _drawerscaffoldkey.currentState!.openEndDrawer();
                      _animationController!.forward();
                    }
                  },
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _animationController!,
                  ),
                ),
              ]
            : null,
      ),
      body: Scaffold(
        key: _drawerscaffoldkey,
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CustomDrawer(),
        ),
        body: screenHeight > 660
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 0.0, left: 16.0, right: 16.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 1.5),
                          child: Text(
                            "The Blueprint of Fine Living",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              // color: Color(0xFF0A4D50),
                              color: Color(0xFF0A4D50),
                              fontSize: 24.0,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                    constraints: BoxConstraints(
                                      minHeight: 256,
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.65,
                                    ),
                                    // color: Color(0xFF0A4D50),
                                    color: Color(0xFF0A4D50),
                                    width: double.infinity,
                                    child: PageView.builder(
                                      itemBuilder: (ctx, i) => SlideItem(i),
                                      itemCount: slideList.length,
                                      controller: _pageController,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: _onPageChanged,
                                    ),
                                  ),
                                  Stack(
                                    alignment: AlignmentDirectional.topCenter,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.all(10.0),
                                            decoration: BoxDecoration(
                                              color: Color(0x99C4C4C4),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(18.0)),
                                            ),
                                            margin: const EdgeInsets.only(
                                                bottom: 48),
                                            child: Row(
                                              children: <Widget>[
                                                for (int i = 0;
                                                    i < slideList.length;
                                                    i++)
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: ExpandableSection(
                            manager: widget.manager,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : ListView(
                padding: const EdgeInsets.only(
                    top: 16.0, bottom: 0.0, left: 16.0, right: 16.0),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 0.5),
                        child: Text(
                          "The Blueprint of Fine Living",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // color: Color(0xFF0A4D50),
                            color: Color(0xFF0A4D50),
                            fontSize: 24.0,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: <Widget>[
                              Container(
                                constraints: BoxConstraints(
                                  minHeight: 256,
                                  maxHeight:
                                      MediaQuery.of(context).size.height * 0.65,
                                ),
                                color: Colors.black,
                                width: double.infinity,
                                child: PageView.builder(
                                  itemBuilder: (ctx, i) => SlideItem(i),
                                  itemCount: slideList.length,
                                  controller: _pageController,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: _onPageChanged,
                                ),
                              ),
                              Stack(
                                alignment: AlignmentDirectional.topCenter,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          color: Color(0x99C4C4C4),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18.0)),
                                        ),
                                        margin:
                                            const EdgeInsets.only(bottom: 48),
                                        child: Row(
                                          children: <Widget>[
                                            for (int i = 0;
                                                i < slideList.length;
                                                i++)
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
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: ExpandableSection(
                          manager: widget.manager,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
