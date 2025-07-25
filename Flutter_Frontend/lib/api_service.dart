import 'dart:convert';                          // For converting Dart objects to JSON
import 'package:flutter/foundation.dart';       // For checking platform (web vs android)
import 'package:http/http.dart' as http;        // HTTP package to make API calls

class ApiService {
  // 🔗 Base URL of your Spring Boot backend
  // If running on Android emulator, use 10.0.2.2 for localhost
  // For web: use localhost (if backend is running on your machine)
  // In production: change this to your public backend URL (e.g., https://your-backend.com)

  static String get baseUrl {
    if (kIsWeb) {
      return "http://localhost:8080/api/students";      // For web testing
    } else {
      return "http://10.0.2.2:8080/api/students";        // For Android emulator
    }
  }

  // 🔸 Function to call the register API
  static Future<http.Response> registerStudent(Map<String, dynamic> data) async {
    final url = Uri.parse("$baseUrl/register");   // → http://10.0.2.2:8080/api/students/register
    return await http.post(
      url,
      body: jsonEncode(data),                     // Convert Dart map to JSON
      headers: {
        "Content-Type": "application/json",       // Tell backend this is JSON data
      },
    );
  }

  // 🔸 Function to call the login API
  static Future<http.Response> loginStudent(Map<String, dynamic> data) async {
    final url = Uri.parse("$baseUrl/login");      // → http://10.0.2.2:8080/api/students/login
    return await http.post(
      url,
      body: jsonEncode(data),                     // Send credentials to backend
      headers: {
        "Content-Type": "application/json",       // Backend expects JSON
      },
    );
  }
}
