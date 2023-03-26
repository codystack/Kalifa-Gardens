import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/custom_drawer.dart';
import '../controller/state_controller.dart';
import '../screens/account_history.dart';
import '../screens/buyer_benefits.dart';
import '../screens/manage_documents.dart';
import '../screens/purchase_plot.dart';
import '../util/preference_manager.dart';
import '../util/service.dart';

class Dashboard extends StatefulWidget {
  final PreferenceManager manager;
  const Dashboard({Key? key, required this.manager}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  AnimationController? _animationController;
  final _controller = Get.find<StateController>();

  _bgInit() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final _token = prefs.getString("accessToken") ?? "";

      final plotResp = await APIService().getPlotTypes(_token);
      debugPrint("PLOT TYPES:: >> ${plotResp.body}");
      _controller.plotTypes.value = [];
      Map<String, dynamic> plotMap = jsonDecode(plotResp.body);
      // final  plotData = PlotTypeResponse.fromJson(plotMap);
      debugPrint("PLOT TYPES CONTENT => ${plotMap['data']}");
      _controller.setPlotTypes(plotMap['data']);

      final propertyResp = await APIService().getPropertyConfig(_token);
      debugPrint("PROPERTY TYPES:: >> ${propertyResp.body}");
      _controller.propertyInfoData.value = {};
      Map<String, dynamic> propertyMap = jsonDecode(propertyResp.body);
      // final propertyData = PropertyResponse.fromJson(propertyMap);
      // debugPrint("PROPERTY NAME => ${propertyData.data?.attributes?.name}");
      _controller.setPropertyInfo(propertyMap);

      final bankResp = await APIService().getBankAccount(_token);
      debugPrint("BANK ACCOUNT:: >> ${bankResp.body}");
      _controller.bankAccountData.value = {};
      Map<String, dynamic> bankMap = jsonDecode(bankResp.body);
      // final propertyData = PropertyResponse.fromJson(propertyMap);
      // debugPrint("PROPERTY NAME => ${propertyData.data?.attributes?.name}");
      _controller.setBankAccount(bankMap);

      final contactResp = await APIService().getContactInfo(_token);
      debugPrint("CONTACT INFO:: >> ${contactResp.body}");
      _controller.contactInfoData.value = {};
      Map<String, dynamic> contactMap = jsonDecode(contactResp.body);
      // final propertyData = PropertyResponse.fromJson(propertyMap);
      // debugPrint("PROPERTY NAME => ${propertyData.data?.attributes?.name}");
      _controller.setContactInfo(contactMap);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _bgInit();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 450),
    );
  }

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

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
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            Card(
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          color: Color(0xFFD4B581),
                          child: SvgPicture.asset(
                            'assets/images/complete_ur_profile.svg',
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'STATUS',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Complete your profile',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.close),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PurchasePlot()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16.0, left: 16.0, right: 10.0),
                        primary: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // color: Color(0x590A4D50),
                              color: Color(0xFF0A4D50),
                              padding: const EdgeInsets.all(16.0),
                              child: SvgPicture.asset(
                                  'assets/images/purchase_plot.svg'),
                            ),
                            Icon(
                              Icons.help_rounded,
                              color: Colors.black54,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          'Purchase Plot',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                  width: 16.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyerBenefits(
                            manager: widget.manager,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16.0, left: 16.0, right: 10.0),
                        primary: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // color: Color(0x590A4D50),
                              color: Color(0xFF0A4D50),
                              padding: const EdgeInsets.all(16.0),
                              child: SvgPicture.asset(
                                  'assets/images/buyer_benefits.svg'),
                            ),
                            Icon(
                              Icons.help_rounded,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          'Buyer Benefits',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountHistory()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16.0, left: 16.0, right: 10.0),
                        primary: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // color: Color(0x590A4D50),
                              color: Color(0xFF0A4D50),
                              padding: const EdgeInsets.all(16.0),
                              child: SvgPicture.asset(
                                  'assets/images/account_history.svg'),
                            ),
                            Icon(
                              Icons.help_rounded,
                              color: Colors.black54,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          'Account History',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                  width: 16.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ManageDocuments()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16.0, left: 16.0, right: 10.0),
                        primary: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // color: Color(0x590A4D50),
                              color: Color(0xFF0A4D50),
                              padding: const EdgeInsets.all(16.0),
                              child: SvgPicture.asset(
                                  'assets/images/manage_documents.svg'),
                            ),
                            Icon(
                              Icons.help_rounded,
                              color: Colors.black54,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          'Manage Documents',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
