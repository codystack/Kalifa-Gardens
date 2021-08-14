import 'dart:async';

import '../components/custom_appbar.dart';
import '../components/custom_drawer.dart';
import '../components/my_documents.dart';
import '../components/proof_of_payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ManageDocuments extends StatefulWidget {
  @override
  _ManageDocumentsState createState() => _ManageDocumentsState();
}

class _ManageDocumentsState extends State<ManageDocuments>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  int _currentPage = 0;
  PageController? _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
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
        actions: [
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
        ],
      ),
      body: Scaffold(
        key: _drawerscaffoldkey,
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CustomDrawer(),
        ),
        body: Container(
          color: Color(0xFFD5E1E1),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: _currentPage == 0
                            ? Color(0xFF686868)
                            : Colors.white,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _currentPage = 0;
                            });
                            _pageController!.animateToPage(
                              _currentPage,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text(
                            'My Documents',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: _currentPage == 0
                                  ? Color(0xFF686868)
                                  : Colors.white,
                              onPrimary: _currentPage == 0
                                  ? Colors.white
                                  : Colors.black,
                              padding: const EdgeInsets.all(4.0),
                              elevation: 0.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: _currentPage == 0
                            ? Colors.white
                            : Color(0xFF686868),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _currentPage = 1;
                            });
                            _pageController!.animateToPage(
                              _currentPage,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text(
                            'Proof of Payment',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: _currentPage == 0
                                  ? Colors.white
                                  : Color(0xFF686868),
                              onPrimary: _currentPage == 0
                                  ? Colors.black
                                  : Colors.white,
                              padding: const EdgeInsets.all(4.0),
                              elevation: 0.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: _onPageChanged,
                  controller: _pageController,
                  children: [
                    MyDocuments(),
                    ProofOfPayment(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
