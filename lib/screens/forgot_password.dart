import 'package:get/get.dart';
import 'package:kalifa_gardens/controller/state_controller.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../components/custom_appbar.dart';
import '../components/custom_drawer.dart';
import '../forms/forgot_password_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  final _controller = Get.find<StateController>();

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlayPro(
        isLoading: _controller.forgotPass > 0 ? true : false,
        backgroundColor: Colors.black54,
        progressIndicator: const LoadingBouncingLine.circle(
          borderColor: Color(0xFF0A4D50),
          borderSize: 3.0,
          size: 120.0,
          backgroundColor: Color(0xFF0A4D50),
          duration: Duration(milliseconds: 500),
        ),
        child: Scaffold(
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
            body: ListView(
              padding: const EdgeInsets.all(24.0),
              children: <Widget>[
                SizedBox(
                  height: 16,
                ),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 35.0, horizontal: 24.0),
                    color: Color(0x4DB2B2B2),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18.0),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                              'assets/images/forgot_pass_error.svg'),
                          SizedBox(
                            width: 10.0,
                          ),
                          SvgPicture.asset(
                              'assets/images/forgot_pass_ellipse.svg'),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                          child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: Color(0xFF0A4D50),
                            fontSize: 32.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Mulish'),
                      )),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ForgotPasswordForm(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
