import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  // Employee Login method
  Future<bool> employeeLogin(String email, String password) async {
    // request body
    final body = jsonEncode({
      "params": {
        "db": "mm23",
        "login": email,
        "password": password,
      }
    });

    final response = await http.post(
      Uri.parse('http://103.123.8.39:8069/hrm/employee_login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    // Print status and response body for debugging
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // Check if the request was successful
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      // Check if status is 'success'
      if (responseData['status'] == 'success') {
        print(
            "Login successful. Session ID: ${responseData['result']['session_id']}");

        return true; // Login successful
      } else {
        print("Login failed: ${responseData['error']}");
      }
    } else {
      print("HTTP error: ${response.statusCode}");
    }

    return false; // Login failed
  }

  // Test Login method to check the API
  // void testLogin(String email, String password) async {
  //   bool isLoggedIn = await login(email, password);
  //   if (isLoggedIn) {
  //     print("Login successful!");
  //   } else {
  //     print("Login failed. Check credentials.");
  //   }
  // }
}
