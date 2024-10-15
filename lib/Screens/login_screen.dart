import 'package:flutter/material.dart';
import 'package:hrm/Repository/ApiServices.dart';
import 'package:hrm/Screens/dashboard_screen.dart';
import 'package:hrm/Screens/home_screen.dart';
import 'package:hrm/Widgets/custom_admin_login_button.dart';
import 'package:hrm/Widgets/custom_button.dart';
import 'package:hrm/Widgets/custom_loading_dialog.dart';
import 'package:hrm/Widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailNameController = TextEditingController();
  final passwordController = TextEditingController();

  // Method to show loading alert dialog
  void _showLoadingDialog(
      {required double width, required String loadingText}) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing the dialog
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.white, // Set custom background color
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(12), // Set custom border radius
            ),
            content: CustomLoadingDialog(
              loadingText: loadingText,
              width: width,
            ));
      },
    );
  }

  // Method to show error alert dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  // API service instance
  final ApiServices _apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the controllers when the screen is removed from memory
    emailNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0E1013),
        resizeToAvoidBottomInset:
            true, // Allows screen to resize when keyboard is displayed
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Color(0xff0E1013),
                  width: width,
                  height: height * 0.27,
                  child: Image.asset(
                    'assets/images/Patterns.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment(0, 0),
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  height: height * 0.27,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Let’s get you signed in and we will make your work life smoother, together.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xffBDC1C6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                // Wrap the content with SingleChildScrollView
                child: Container(
                  width: width,
                  height: height * 0.73,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * 0.06),
                      topRight: Radius.circular(width * 0.06),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.03),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .06),
                        child: const Text(
                          'Ensure that your account is associated with your company\'s email address to access our applications.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.03),

                      // Email Field
                      CustomTextField(
                        prefixIcon: Icon(Icons.sms_outlined),
                        hintText: 'example@gmail.com',
                        obscure: false,
                        controller: emailNameController,
                      ),
                      SizedBox(height: height * 0.01),

                      // Password Field
                      CustomTextField(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: '**********',
                        obscure: true,
                        controller: passwordController,
                      ),
                      SizedBox(height: height * 0.02),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),

                      // Employee Login Button
                      // Login Button
                      CustomButton(
                        buttonText: 'Sign In',
                        onTap: () async {
                          String email = emailNameController.text;
                          String password = passwordController.text;

                          _showLoadingDialog(
                              width: width * 0.90,
                              loadingText: 'Signing in...');

                          // Proceed with login attempt
                          bool isLoggedIn =
                              await _apiServices.employeeLogin(email, password);

                          // Close the loading dialog
                          Navigator.of(context).pop();

                          if (isLoggedIn) {
                            // Clear text fields after successful login
                            emailNameController.clear();
                            passwordController.clear();

                            // Navigate to the dashboard screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          } else {
                            // Show an alert dialog for failed login
                            _showErrorDialog(
                                'Login failed. Check your credentials.');
                          }
                        },
                      ),
                      SizedBox(height: height * 0.03),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                        child: const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.7,
                                color: Color(0xffDADCE0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'or continue',
                                style: TextStyle(
                                  color: Color(0xffDADCE0),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.7,
                                color: Color(0xffDADCE0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.03),

                      //Admin Hr Login Button
                      CustomAdminLoginButton(
                        buttonText: 'Sign in as HR/Admin',
                        onTap: () {
                          //_showLoadingDialog(width: width * 0.90, loadingText: 'Logging in...');
                        },
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 18,
                              color: Color(0xff9AA0A6),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text(
                                  'If you encounter issues, please contact your company\'s HR department for assistance.',
                                  style: TextStyle(
                                    color: Color(0xff9AA0A6),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
