import 'package:demo_app/components/custom_appbar.dart';
import 'package:demo_app/components/custom_drawer.dart';
import 'package:demo_app/forms/individual_registration_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IndividualRegistration extends StatefulWidget {
  @override
  _IndividualRegistrationState createState() => _IndividualRegistrationState();
}

class _IndividualRegistrationState extends State<IndividualRegistration> with TickerProviderStateMixin {

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();

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
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Color(0xFFE8E8E8),
              child: Center(
                child: Text(
                  'REGISTRATION',
                  style: TextStyle(
                    color: Color(0xFF0A4D50),
                    fontWeight: FontWeight.w600,
                    fontSize: 21.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(6.0),
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () => {},
                      child: SvgPicture.asset('assets/images/google_icon.svg'),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6.0),
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () => {},
                      child: SvgPicture.asset('assets/images/facebook_icon.svg'),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6.0),
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () => {},
                      child: SvgPicture.asset('assets/images/microsoft_icon.svg'),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: IndividualForm(),
            )
          ],
        ),
      ),
    );
  }
}
