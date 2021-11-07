import 'package:get/get.dart';
import 'package:kalifa_gardens/components/loader/overlay_loader.dart';
import 'package:kalifa_gardens/components/t_and_c_alert.dart';
import 'package:kalifa_gardens/controller/state_controller.dart';
import 'package:kalifa_gardens/util/constants.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../forms/individual_registration_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IndividualRegistration extends StatefulWidget {
  @override
  _IndividualRegistrationState createState() => _IndividualRegistrationState();
}

class _IndividualRegistrationState extends State<IndividualRegistration>
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
        isLoading: _controller.isLoading.value,
        backgroundColor: Constants.overlayColor,
        progressIndicator: OverlayLoader(),
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
          ),
          body: Obx(
            () => ListView(
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                _controller.isAccepted < 1
                    ? Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        color: Color(0xFFE8E8E8),
                        child: Center(
                          child: Text(
                            'REGISTRATION',
                            style: TextStyle(
                              // color: Color(0xFF0A4D50),
                              color: Color(0xFF0A4D50),
                              fontWeight: FontWeight.w600,
                              fontSize: 21.0,
                              fontFamily: 'Mulish',
                            ),
                          ),
                        ),
                      )
                    : TAndCAlert(),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(4.0),
                      height: MediaQuery.of(context).size.height * 0.11,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                            style: BorderStyle.solid),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () => {},
                          child: SvgPicture.asset(
                            'assets/images/google_icon.svg',
                            fit: BoxFit.cover,
                            height: 28,
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(4.0),
                      height: MediaQuery.of(context).size.height * 0.11,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                            style: BorderStyle.solid),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () => {},
                          child: SvgPicture.asset(
                            'assets/images/facebook_icon.svg',
                            fit: BoxFit.cover,
                            height: 28,
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.11,
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                            style: BorderStyle.solid),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () => {},
                          child: SvgPicture.asset(
                            'assets/images/microsoft_icon.svg',
                            fit: BoxFit.cover,
                            height: 28,
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                          ),
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
        ),
      ),
    );
  }
}
