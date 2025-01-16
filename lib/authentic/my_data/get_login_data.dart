import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class GetLoginData {
  static Future<void> loginUser(
      {required BuildContext context,
      required String username,
      required String password}) async {
    if (username.isEmpty || password.isEmpty) {
      _showSnackBar(context, 'Provide both username and password');
      return;
    }

    final url = Uri.parse('http://10.0.2.2:5000/auth/login');
    try {
      final response = await http
          .post(
            url,
            headers: {'content-Type': 'application/json'},
            body: jsonEncode({'username': username, 'password': password}),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final successMessage =
            jsonDecode(response.body)['message'] ?? 'Logged in successfully';
        _showSnackBar(context, successMessage);
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        final errorMessage =
            jsonDecode(response.body)['error'] ?? 'Failed to log in ';
        _showSnackBar(context, 'Failed to Log In: $errorMessage');
      }
    } catch (e) {
      _showSnackBar(context, 'Error: $e');
    }
  }

  static void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
