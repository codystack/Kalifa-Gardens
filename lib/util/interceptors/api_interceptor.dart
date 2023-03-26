import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:kalifa_gardens/controller/state_controller.dart';
import 'package:kalifa_gardens/screens/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApiInterceptor implements InterceptorContract {
  final _controller = Get.find<StateController>();

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      final cache = await SharedPreferences.getInstance();

      // data.params['appid'] = cache.getString("accessToken");
      // data.params['units'] = 'metric';
      data.headers[HttpHeaders.contentTypeHeader] = "application/json";
      data.headers[HttpHeaders.authorizationHeader] =
          "Bearer " + cache.getString("accessToken")!;
    } on SocketException catch (_) {
      _controller.setLoading(false);
      Fluttertoast.showToast(
        msg: "Check your internet connection!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.grey[800],
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      _controller.setLoading(false);
      print(e);
    }
    // print("PAYLOADs: => ${data.params}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (data.statusCode == 401 || data.statusCode == 403) {
      //Unauthorized. Logout user here...
      print("LOG THIS USER OUT. SESSION EXPIRED!!!");
      //Clear preferences here...
      Get.offAll(Login());
    }
    return data;
  }
}
