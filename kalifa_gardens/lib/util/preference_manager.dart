import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
//    setState(() {
//      _counter = (prefs.getInt('counter') ?? 0);
//    });
  }

}