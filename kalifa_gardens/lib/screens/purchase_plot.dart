import 'package:demo_app/components/custom_appbar.dart';
import 'package:demo_app/components/custom_drawer.dart';
import 'package:demo_app/components/purchase_plot_step_indicator.dart';
import 'package:demo_app/components/purchase_plot_steps/step1.dart';
import 'package:demo_app/components/purchase_plot_steps/step2.dart';
import 'package:demo_app/components/purchase_plot_steps/step3.dart';
import 'package:demo_app/components/purchase_plot_steps/step4.dart';
import 'package:demo_app/components/purchase_plot_steps/step5.dart';
import 'package:demo_app/controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PurchasePlot extends StatefulWidget {
  @override
  _PurchasePlotState createState() => _PurchasePlotState();
}

class _PurchasePlotState extends State<PurchasePlot> with TickerProviderStateMixin {

  AnimationController _animationController;

  final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  final _controller = Get.find<StateController>();

  // ignore: missing_return
  Future<bool> _handleBackPressed() {
    if (_controller.purchasePlotStepCount > 0) {
      _controller.decrement();
    }
    // ignore: unrelated_type_equality_checks
    else if (_controller.purchasePlotStepCount == 4 && _controller.individualSubStep > 1) {
      _controller.decrementIndividualSub();
    }
    // ignore: unrelated_type_equality_checks
    else if (_controller.purchasePlotStepCount == 4 && _controller.corporateSubStep > 1) {
      _controller.decrementCorporateSub();
    }
    else {
      Navigator.pop(context);
    }

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleBackPressed,
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
          body: Obx(
            () => ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      // ignore: unrelated_type_equality_checks
                      _controller.purchasePlotStepCount == 0 ? 'STEP ONE' : _controller.purchasePlotStepCount == 1 ? 'STEP TWO' : _controller.purchasePlotStepCount == 2 ? 'STEP THREE' : _controller.purchasePlotStepCount == 3 ? 'STEP FOUR' : 'STEP FIVE',
                      style: TextStyle(
                        color: Color(0xFF6DA544),
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (var i=0; i<5; i++)
                          // ignore: unrelated_type_equality_checks
                          if (_controller.purchasePlotStepCount == i)
                            PurchasePlotStepIndicator(true)
                          else
                            PurchasePlotStepIndicator(false)
                      ],
                    )
                  ],
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ignore: unrelated_type_equality_checks
                      if (_controller.purchasePlotStepCount == 0)
                        PurchasePlotStep1(stepIndex: _controller.purchasePlotStepCount)
                      // ignore: unrelated_type_equality_checks
                      else if (_controller.purchasePlotStepCount == 1)
                        PurchasePlotStep2(stepIndex: _controller.purchasePlotStepCount)
                      // ignore: unrelated_type_equality_checks
                      else if (_controller.purchasePlotStepCount == 2)
                        PurchasePlotStep3(stepIndex: _controller.purchasePlotStepCount)
                      // ignore: unrelated_type_equality_checks
                      else if (_controller.purchasePlotStepCount == 3)
                        PurchasePlotStep4(stepIndex: _controller.purchasePlotStepCount)
                      // ignore: unrelated_type_equality_checks
                      else if (_controller.purchasePlotStepCount == 4)
                        PurchasePlotStep5()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}