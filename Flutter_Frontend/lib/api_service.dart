import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String get baseUrl {
    if (kIsWeb) {
      return "http://localhost:8080/api/students";
    } else {
      return "http://10.0.2.2:8080/api/students";
    }
  }

  static Future<http.Response> registerStudent(Map<String, dynamic> data) async {
    final url = Uri.parse("$baseUrl/register");
    return await http.post(
      url,
      body: jsonEncode(data),
      headers: {
        "Content-Type": "application/json",
      },
    );
  }

  static Future<http.Response> loginStudent(Map<String, dynamic> data) async {
    final url = Uri.parse("$baseUrl/login");
    return await http.post(
      url,
      body: jsonEncode(data),
      headers: {
        "Content-Type": "application/json",
      },
    );
  }

  // ✅ Add this method
  static Future<http.Response> forgotPassword(String email) async {
    final url = Uri.parse("$baseUrl/forgot-password");
    return await http.post(
      url,
      body: jsonEncode({'email': email}),
      headers: {
        "Content-Type": "application/json",
      },
    );
  }
  // ✅ Add this method
  static Future<http.Response> verifyOtp(String emailOrPhone, String otp) async {
    final url = Uri.parse("$baseUrl/verify-otp");
    final body = jsonEncode({
      "emailOrPhone": emailOrPhone,
      "otp": otp,
    });

    return await http.post(
      url,
      body: body,
      headers: {
        "Content-Type": "application/json",
      },
    );
  }
}
