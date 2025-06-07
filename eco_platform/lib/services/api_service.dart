import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.1.13:5000/api';

  // Login user
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'password': password}),
      );

      final responseData = json.decode(response.body);

      if (response.statusCode >= 400) {
        throw Exception(responseData['message'] ?? 'Login failed');
      }

      return responseData;
    } catch (e) {
      if (kDebugMode) {
        print('Login error: $e');
      }
      throw Exception('Failed to login: $e');
    }
  }

  // Register user
  Future<Map<String, dynamic>> register(
    String username,
    String password,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'username': username, 'password': password}),
      );

      final responseData = json.decode(response.body);

      if (response.statusCode >= 400) {
        throw Exception(responseData['message'] ?? 'Registration failed');
      }

      return responseData;
    } catch (e) {
      if (kDebugMode) {
        print('Registration error: $e');
      }
      throw Exception('Failed to register: $e');
    }
  }

  // Submit certificate
  Future<Map<String, dynamic>> submitCertificate(
    String token,
    String name,
    String club,
    String event,
    String date,
    String certificateId,
  ) async {
    try {
      // Parse the date from "dd/mm/yyyy" to a more standard format "yyyy-mm-dd"
      final dateParts = date.split('/');
      if (dateParts.length == 3) {
        date = "${dateParts[2]}-${dateParts[1]}-${dateParts[0]}";
      }
      
      final response = await http.post(
        Uri.parse('$baseUrl/certificates/submit'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'name': name,
          'club': club,
          'event': event,
          'date': date,
          'certificateId': certificateId,
        }),
      );

      final responseData = json.decode(response.body);

      if (response.statusCode >= 400) {
        throw Exception(
          responseData['message'] ?? 'Certificate submission failed',
        );
      }

      return responseData;
    } catch (e) {
      if (kDebugMode) {
        print('Certificate submission error: $e');
      }
      throw Exception('Failed to submit certificate: $e');
    }
  }
}