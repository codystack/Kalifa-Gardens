import 'package:flutter/material.dart';
import 'package:kalifa_gardens/screens/dashboard.dart';
import 'package:kalifa_gardens/screens/onboarding.dart';
import 'package:kalifa_gardens/util/preference_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends StatefulWidget {
  final PreferenceManager manager;
  const Controller({Key? key, required this.manager}) : super(key: key);

  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  bool? _isLoggedIn = false;
  bool? _isPhoneVerified = false;

  _loadController() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('loggedIn') ?? false;
    // if (_manager != null) {
    //   _isPhoneVerified = _manager?.getUser().isPhoneVerified ?? false;
    // } else {
    //   _isPhoneVerified = false;
    // }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoggedIn = widget.manager.getIsLoggedIn();
    });
    // _loadController();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _isLoggedIn = widget.manager.getIsLoggedIn();
    });
    return (widget.manager.getIsLoggedIn() || _isPhoneVerified!)
        ? Dashboard(
            manager: widget.manager,
          )
        : Onboarding(
            manager: widget.manager,
          );
  }
}
