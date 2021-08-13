import 'dart:async';

import 'package:demo_app/components/custom_appbar.dart';
import 'package:demo_app/components/custom_drawer.dart';
import 'package:demo_app/components/project_profile_slide_item.dart';
import 'package:demo_app/components/slide_dots.dart';
import 'package:demo_app/model/project_profile_slides.dart';
import 'package:demo_app/screens/buyer_benefits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProjectProfile extends StatefulWidget {
  @override
  _ProjectProfileState createState() => _ProjectProfileState();
}

class _ProjectProfileState extends State<ProjectProfile> with TickerProviderStateMixin {

  int _currentPage = 0;
  PageController _pageController =  PageController(initialPage: 0);

  AnimationController _animationController;

  final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();
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

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
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
                if (_drawerscaffoldkey.currentState.isEndDrawerOpen) {
                  _animationController.reverse();
                  Navigator.pop(context);
                }
                else {
                  _drawerscaffoldkey.currentState.openEndDrawer();
                  _animationController.forward();
                }
              },
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _animationController,
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
        body: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.all(10.0),
              color: Color(0xFFD4B581),
              child: Center(
                child: Text(
                  'Project Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 21.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
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
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Color(0xFF0A4D50),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 16.0,),
                  Text(
                    'About Kalifa Gardens',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    'Kalifa Gardens is a 190-hectare master-planned community located at Majidun, Ikorodu, Lagos State. This new district is included in the Lagos State master plan and will offer plots of lands and homes for sale to the general public. '
                        '\n\nKalifa Gardens is sent to roll-out a 50-hectare gated estate in its first two (2) years after reclamation as part of its vision to provide prime and affordable communities in Lagos Mainland.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(height: 36.0,),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                color: Colors.grey[400],
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/images/zonal_masterplan.png'),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Zonal Masterplan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  border: Border.all(color: Colors.grey[400], width: 1.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Project Timeline',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),),

                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  border: Border.all(color: Colors.grey[400], width: 1.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Contact Sales',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),),
                    SizedBox(height: 32,),
                    Text(
                      'EMAIL ADDRESS',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'sales@kalifagardens.com',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 32,),
                    Text(
                      'PHONE NUMBER',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '+234 567 890 1234',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 32,),
                    Text(
                      'OFFICE ADDRESS',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Orange Island Projects Office, 22, Dr. Omon Ebhomenye Street, off Awudu Ekpegha Street, Lekki Phase One, Lagos, Nigeria',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Container(
                width: double.infinity,
                color: Colors.black,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BuyerBenefits()),
                    );
                  },
                  child: Text(
                    'See Buyer Benefits',
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
                    padding: const EdgeInsets.all(8.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*

 */