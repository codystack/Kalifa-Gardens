import 'package:demo_app/components/custom_appbar.dart';
import 'package:demo_app/components/custom_drawer.dart';
import 'package:demo_app/forms/forgot_password_form.dart';
import 'package:demo_app/screens/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> with TickerProviderStateMixin {

  AnimationController _animationController;

  final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  color: Colors.grey[400],
                  child: Container(
                    padding: const EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                    ),
                    child: Center(
                      child: Icon(Icons.check, color: Colors.green, size: 48.0,),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
                      child: Text(
                        'Success!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF0A4D50),
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Your account has been successfully created',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: double.infinity,
                        color: Colors.black,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text(
                            'Continue to Login',
                            style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              onPrimary: Colors.white,
                              padding: const EdgeInsets.all(18.0)
                          ),
                        ),
                      ),
                    )
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
