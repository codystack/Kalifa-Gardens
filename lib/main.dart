import 'package:kalifa_gardens/controller/app_controller.dart';
import 'package:kalifa_gardens/util/preference_manager.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/state_controller.dart';
import 'style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  final _controller = Get.put(StateController());
  late PreferenceManager _manager;

  // _loadController() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   _isLoggedIn = prefs.getBool('loggedIn') ?? false;
  // }

  @override
  void initState() {
    super.initState();
    _manager = PreferenceManager(context);
    // // _loadController();
    // if (_manager != null) {
    //   setState(() {
    //     _isLoggedIn = _manager!.getIsLoggedIn();
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    // _isLoggedIn = _manager!.getIsLoggedIn();
    return GetMaterialApp(
      title: "Kalifa",
      debugShowCheckedModeBanner: false,
      home: Controller(manager: _manager),
      theme: ThemeData(
        appBarTheme:
            Theme.of(context).appBarTheme.copyWith(brightness: Brightness.dark),
        // primaryColor: Color(0xFF0A4D50),
        primaryColor: Color(0xFF0A4D50),
        colorScheme: ThemeData().colorScheme.copyWith(
              // primary: Color(0xFF0A4D50),
              primary: Color(0xFF0A4D50),
              secondary: Color(0xFFD4B581),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Color(0xFF0A4D50),
          fillColor: Color.fromARGB(255, 0, 0, 0),
          // focusColor: Color(0xFF0A4D50),
          // fillColor: Color(0xFF0A4D50),
          border: OutlineInputBorder(borderRadius: BorderRadius.zero),
          labelStyle: TextStyle(color: Color(0xFF0A4D50)
              // color: Color(0xFF0A4D50),
              ),
          hintStyle: TextStyle(
            color: Colors.black38,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.zero),
            borderSide: BorderSide(color: Color(0xFF0A4D50)
                // color: Color(0xFF0A4D50),
                ),
          ),
        ),
        textTheme: TextTheme(bodyText2: BodyTextStyle),
      ),
      supportedLocales: [
        Locale("en"),
        Locale("es"),
        Locale("fa"),
        Locale("fr"),
      ],
    );
  }
}
