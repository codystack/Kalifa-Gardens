import 'dart:async';
import '../components/buyer_benefit_item.dart';
import '../components/custom_appbar.dart';
import '../components/custom_drawer.dart';
import '../model/buyer_benefit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuyerBenefits extends StatefulWidget {
  @override
  _BuyerBenefitsState createState() => _BuyerBenefitsState();
}

class _BuyerBenefitsState extends State<BuyerBenefits>
    with TickerProviderStateMixin {
  int _currentPage = 0;
  PageController? _pageController = PageController(initialPage: 0);
  AnimationController? _animationController;

  final List benefitsList = [
    BuyerBenefit(
        title: "Education Hub",
        description:
            "A hub that uses open spaces to promote interaction, learning and experiments in primary and secondary schools.",
        imageSlides: [
          "assets/images/stub_image_2.png",
          "assets/images/stub_image_2.png",
          "assets/images/stub_image_2.png",
          "assets/images/stub_image_3.png",
        ]),
    BuyerBenefit(
        title: "Commercial Hub",
        description:
            "Containing all the necessary utilities for basic essentials and convenience; hotel, mosque, hospital, police and fire stations, modern shopping mall, office complex, church, fuel station, bank.",
        imageSlides: [
          "assets/images/stub_image_3.png",
          "assets/images/stub_image_3.png",
          "assets/images/stub_image_3.png",
          "assets/images/stub_image_2.png",
        ]),
  ];

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

      _animationController = AnimationController(
          vsync: this, duration: Duration(milliseconds: 450));
    });
  }

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

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
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                color: Color(0xFFD4B581),
                child: Center(
                  child: Text(
                    'Estate Features',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 21.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 21.0,
              ),
              Column(
                children: <Widget>[
                  for (var a = 0; a < benefitsList.length; a++)
                    BuyerBenefitItem(buyerBenefit: benefitsList[a])
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
