import 'dart:convert';
import 'package:email_otp/models/login_response_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<LoginResponseModel> otpLogin(String email) async {
    var url = Uri.https(
      "thesis-prototype-object-counting-uwen.vercel.app", // Use https here
      "api/otp-login",
    );

    var response = await client.post(
      url,
      headers: {"Content-type": "application/json"},
      body: jsonEncode({"email": email}),
    );

    if (response.statusCode == 200) {
      print("Response body: ${response.body}"); // Log the response body
      // Ensure the response is JSON
      if (response.headers['content-type']?.contains('application/json') ??
          false) {
        return loginResponseModel(response.body);
      } else {
        throw Exception(
          "Expected JSON, but received ${response.headers['content-type']}",
        );
      }
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  static Future<LoginResponseModel> verifyOTP(
    String email,
    String otpCode,
    String otpHash,
  ) async {
    var url = Uri.https(
      "thesis-prototype-object-counting-uwen.vercel.app",
      "api/otp-verify",
    );

    var response = await client.post(
      url,
      headers: {"Content-type": "application/json"},
      body: jsonEncode({"email": email, "otp": otpCode, "otpHash": otpHash}),
    );
    print("Email: $email, OTP Code: $otpCode, OTP Hash: $otpHash");

    if (response.statusCode == 200) {
      return loginResponseModel(response.body);
    } else {
      throw Exception(
        "Failed to verify OTP. Status code: ${response.statusCode}",
      );
    }
  }
}
