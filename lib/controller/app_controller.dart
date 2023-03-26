import 'package:flutter/material.dart';

import '../screens/dashboard.dart';
import '../screens/onboarding/walkthrough.dart';
import '../util/preference_manager.dart';

class Controller extends StatefulWidget {
  final PreferenceManager manager;
  const Controller({Key? key, required this.manager}) : super(key: key);

  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  // bool? _isLoggedIn = false;
  bool? _isPhoneVerified = false;

  // _loadController() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   _isLoggedIn = prefs.getBool('loggedIn') ?? false;
  //   // if (_manager != null) {
  //   //   _isPhoneVerified = _manager?.getUser().isPhoneVerified ?? false;
  //   // } else {
  //   //   _isPhoneVerified = false;
  //   // }
  // }

  @override
  void initState() {
    super.initState();

    // _loadController();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.manager.getIsLoggedIn() || _isPhoneVerified!)
        ? Dashboard(
            manager: widget.manager,
          )
        : Walkthrough(
            manager: widget.manager,
          );
  }
}
