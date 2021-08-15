import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'constants.dart';

class APIService {
  Future<http.Response> getFAQs() async {
    return await http.get(Uri.parse('${Constants.baseUrl}/faqs'));
  }

  Future<http.Response> getTandC() async {
    return await http.get(Uri.parse('${Constants.baseUrl}/terms'));
  }

  Future<http.Response> getBusinessType() async {
    return await http.get(Uri.parse('${Constants.baseUrl}/business-types'));
  }

  Future<http.Response> getNewsItems() async {
    return await http.get(Uri.parse('${Constants.baseUrl}/news-items'));
  }

  Future<http.Response> createOTP(String email, String type) async {
    return await http.post(
      Uri.parse('${Constants.baseUrl}/otps'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(<String, String>{'email': email, 'type': type}),
    );
  }

  Future<http.Response> resendOTP(String id) async {
    return await http.post(
      Uri.parse('${Constants.baseUrl}/otp/resend'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(<String, String>{
        'id': id,
      }),
    );
  }

  Future<http.Response> createAccount(Map data) async {
    return await http.post(
      Uri.parse('${Constants.baseUrl}/auth/local/register'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(data),
    );
  }
}
