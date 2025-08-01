import 'dart:convert';                          // For converting Dart objects to JSON
import 'package:flutter/foundation.dart';       // For checking platform (web vs android)
import 'package:http/http.dart' as http;        // HTTP package to make API calls

class ApiService {
  // 🔗 Base URL of your Spring Boot backend
  static String get baseUrl {
    if (kIsWeb) {
      return "http://localhost:8080/api/students";      // For web testing
    } else {
      return "http://10.0.2.2:8080/api/students";        // For Android emulator
    }
  }

  // 🔸 Function to call the register API
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

  // 🔸 Function to call the login API
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

  //function for otp verification
  static Future<http.Response> verifyOtp(String emailOrPhone, String otp) async {
    final url = Uri.parse("$baseUrl/verify-otp");
    return await http.post(
      url,
      body: jsonEncode({
        "emailOrPhone": emailOrPhone,
        "otp": otp,
      }),
      headers: {
        "Content-Type": "application/json",
      },
    );
  }

  // 🔸 Function to call the forgot password API
  static Future<http.Response> forgotPassword(String emailOrPhone) async {
    final url = Uri.parse("$baseUrl/forgot-password");
    return await http.post(
      url,
      body: jsonEncode({"emailOrPhone": emailOrPhone}),
      headers: {
        "Content-Type": "application/json",
      },
    );
  }
}
