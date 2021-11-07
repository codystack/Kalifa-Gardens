import 'dart:convert';

import 'package:kalifa_gardens/components/loader/overlay_loader.dart';
import 'package:kalifa_gardens/model/plot_type.dart';
import 'package:kalifa_gardens/model/property_config_response.dart';
import 'package:kalifa_gardens/util/constants.dart';
import 'package:kalifa_gardens/util/preference_manager.dart';
import 'package:kalifa_gardens/util/service.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../components/custom_drawer.dart';
import '../components/purchase_plot_step_indicator.dart';
import '../components/purchase_plot_steps/step1.dart';
import '../components/purchase_plot_steps/step2.dart';
import '../components/purchase_plot_steps/step3.dart';
import '../components/purchase_plot_steps/step4.dart';
import '../components/purchase_plot_steps/step5.dart';
import '../controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PurchasePlot extends StatefulWidget {
  @override
  _PurchasePlotState createState() => _PurchasePlotState();
}

class _PurchasePlotState extends State<PurchasePlot>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  final _controller = Get.find<StateController>();
  double _unitPrice = 0.0;
  List<PlotType> _plotType = [];
  late PreferenceManager _manager;

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _manager = PreferenceManager(context);
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));

    // getPropertyConfig();
  }

  // ignore: missing_return
  Future<bool> _handleBackPressed() async {
    if (_controller.purchasePlotStepCount > 0) {
      _controller.decrement();
    } else if (_controller.purchasePlotStepCount.value == 4 &&
        _controller.individualSubStep > 1) {
      _controller.decrementIndividualSub();
    } else if (_controller.purchasePlotStepCount.value == 4 &&
        _controller.corporateSubStep > 1) {
      _controller.decrementCorporateSub();
    } else {
      Navigator.pop(context);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleBackPressed,
      child: Obx(
        () => LoadingOverlayPro(
          backgroundColor: Constants.overlayColor,
          isLoading: _controller.isPurchase.value,
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
              actions: [
                IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.notifications,
                  ),
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
              body: Obx(
                () => ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _controller.purchasePlotStepCount.value == 0
                              ? 'STEP ONE'
                              : _controller.purchasePlotStepCount.value == 1
                                  ? 'STEP TWO'
                                  : _controller.purchasePlotStepCount.value == 2
                                      ? 'STEP THREE'
                                      : _controller.purchasePlotStepCount
                                                  .value ==
                                              3
                                          ? 'STEP FOUR'
                                          : 'STEP FIVE',
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
                            for (var i = 0; i < 5; i++)
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
                          if (_controller.purchasePlotStepCount.value == 0)
                            PurchasePlotStep1(
                              stepIndex: _controller.purchasePlotStepCount,
                              manager: _manager,
                            )
                          else if (_controller.purchasePlotStepCount.value == 1)
                            PurchasePlotStep2(
                              stepIndex: _controller.purchasePlotStepCount,
                              manager: _manager,
                            )
                          else if (_controller.purchasePlotStepCount.value == 2)
                            PurchasePlotStep3(
                                stepIndex: _controller.purchasePlotStepCount)
                          else if (_controller.purchasePlotStepCount.value == 3)
                            PurchasePlotStep4(
                                stepIndex: _controller.purchasePlotStepCount)
                          else if (_controller.purchasePlotStepCount.value == 4)
                            PurchasePlotStep5()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
