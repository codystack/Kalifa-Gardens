import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static const String baseUrl = "http://159.65.122.73:1337";
  // static const String baseUrl = "https://api.kalifagardens.com";
  // static const String baseUrlOld = "https://api.kalifagardens.net";

  static const Color primaryColor = Color(0xFF0A4D50);
  static const Color accentColor = Color(0xFFD4B581);
  static const Color overlayColor = Color(0xb70a4d50);

  static toast(String message) {
    Fluttertoast.showToast(
      msg: "$message",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Color(0xFF0A4D50),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
