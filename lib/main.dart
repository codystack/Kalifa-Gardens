import '../screens/dashboard.dart';
import '../screens/onboarding.dart';
import '../screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  _loadController() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('loggedIn') ?? false;
  }

  @override
  void initState() {
    _loadController();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kalifa",
      debugShowCheckedModeBanner: false,
      home: _isLoggedIn ? Dashboard() : Onboarding(),
      theme: ThemeData(
        appBarTheme:
            Theme.of(context).appBarTheme.copyWith(brightness: Brightness.dark),
        primaryColor: Color(0xFF0A4D50),
        accentColor: Color(0xFFD4B581),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Color(0xFF0A4D50),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.zero),
            borderSide: BorderSide(
              color: Color(0xFF0A4D50),
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
