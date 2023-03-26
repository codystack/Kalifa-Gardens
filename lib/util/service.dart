import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

import '../controller/state_controller.dart';
import 'constants.dart';
import 'interceptors/api_interceptor.dart';
import 'interceptors/token_retry.dart';

class APIService {
  final _controller = Get.find<StateController>();
  http.Client client = InterceptedClient.build(
    interceptors: [
      MyApiInterceptor(),
    ],
    retryPolicy: ExpiredTokenRetryPolicy(),
  );

  Future<http.Response> getFAQs() async {
    return await http.get(Uri.parse('${Constants.baseUrl}/api/faqs'));
  }

  Future<http.Response> getTandC() async {
    return await http
        .get(Uri.parse('${Constants.baseUrl}/api/terms-and-conditions'));
  }

  Future<http.Response> getPolicy() async {
    return await http.get(Uri.parse('${Constants.baseUrl}/api/privacy-policy'));
  }

  Future<http.Response> getBusinessType() async {
    return await http.get(Uri.parse('${Constants.baseUrl}/api/business-types'));
  }

  Future<http.Response> getNews() async {
    return await http.get(Uri.parse('${Constants.baseUrl}/api/news-items'));
  }

  Future<http.Response> createOTP(String email, String type) async {
    return await http.post(
      Uri.parse('${Constants.baseUrl}/api/otp/challenge'),
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
      Uri.parse('${Constants.baseUrl}/api/auth/local/register'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(data),
    );
  }

  Future<http.Response> login(Map data) async {
    return await http.post(
      Uri.parse('${Constants.baseUrl}/api/auth/local'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(data),
    );
  }

  Future<http.Response> forgotPassword(Map data) async {
    return await http.post(
      Uri.parse('${Constants.baseUrl}/api/auth/forgot-password'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(data),
    );
  }

  Future<http.Response> resetPassword(Map data) async {
    return await http.post(
      Uri.parse('${Constants.baseUrl}/auth/reset-password'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(data),
    );
  }

  Future<http.Response> getPropertyConfig(String token) async {
    return await client.get(
      Uri.parse('${Constants.baseUrl}/api/property'),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer " + token,
      },
    );
  }

  Future<http.Response> getPlotTypes(String token) async {
    return await client.get(
      Uri.parse('${Constants.baseUrl}/api/plot-types'),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer " + token,
      },
    );
  }

  Future<http.Response> getBankAccount(String token) async {
    return await client.get(
      Uri.parse('${Constants.baseUrl}/api/bank-account'),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer " + token,
      },
    );
  }

  Future<http.Response> getContactInfo(String token) async {
    return await client.get(
      Uri.parse('${Constants.baseUrl}/api/contact-information'),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer " + token,
      },
    );
  }

  Future<http.Response> getMyApplications(String token) async {
    return await client.get(
      Uri.parse('${Constants.baseUrl}/api/application/me'),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer " + token,
      },
    );
  }

  Future<http.Response> startApplication(
      {required String token, required Map data}) async {
    return await client.post(
      Uri.parse('${Constants.baseUrl}/api/application/start'),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer " + token,
      },
      body: jsonEncode(data),
    );
  }

  Future<http.Response> acceptOffer(
      {required String token, required String applicationID}) async {
    return await client.patch(
      Uri.parse(
          '${Constants.baseUrl}/api/application/$applicationID/offer/status'),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer " + token,
      },
      body: jsonEncode({"status": "accepted"}),
    );
  }

  Future<http.Response> rejectOffer(
      {required String token,
      required String applicationID,
      required String reason}) async {
    return await client.patch(
      Uri.parse(
          '${Constants.baseUrl}/api/application/$applicationID/offer/status'),
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer " + token,
      },
      body: jsonEncode({
        "status": "rejected",
        "reason": reason,
      }),
    );
  }
}
