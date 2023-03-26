import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class PreferenceManager {
  final BuildContext? context;
  var prefs;

  PreferenceManager(this.context) {
    init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void saveAccessToken(String token) {
    prefs.setString('accessToken', token);
  }

  void setIsLoggedIn(bool logIn) {
    prefs?.setBool('loggedIn', logIn);
  }

  bool getIsLoggedIn() => prefs?.getBool('loggedIn') ?? false;

  String getAccessToken() =>
      prefs != null ? prefs!.getString('accessToken') : '';

  void setUserProfile(String rawJson) {
    prefs!.setString('user', rawJson);
  }

  User getUser() {
    final rawJson = prefs != null ? prefs.getString('user') : '{}';
    Map<String, dynamic> map = jsonDecode(rawJson);
    return User.fromJson(map);
  }

  String getUserProfile() {
    final rawJson = prefs?.getString('user');
    return rawJson;
  }
}
