import 'dart:convert';

import 'package:email_otp/models/login_response_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<LoginResponseModel> otpLogin(String email) async {
    var url = Uri.http(
      "https://thesis-prototype-object-counting-uwen.vercel.app/",
      "api/otp-login",
    );

    var response = await client.post(
      url,
      headers: {"Content-type": "application/json"},
      body: jsonEncode({"email": email}),
    );

    return loginResponseModel(response.body);
  }

  static Future<LoginResponseModel> verifyOTP(
    String email,
    String otpCode,
    String otpHash,
  ) async {
    var url = Uri.http(
      "https://thesis-prototype-object-counting-uwen.vercel.app/",
      "api/otp-verify",
    );

    var response = await client.post(
      url,
      headers: {"Content-type": "application/json"},
      body: jsonEncode({"email": email, "otp": otpCode, "otpHash": otpHash}),
    );

    return loginResponseModel(response.body);
  }
}
