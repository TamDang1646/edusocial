import 'package:flutter/material.dart';
import 'package:my_app/screens/home_screen/home_screen.dart';
import 'package:my_app/screens/login_screen/login_screen.dart';
import 'package:my_app/screens/otp_screen/otp_screen.dart';
import 'package:my_app/screens/signup_screen/signup_screen.dart';
import '../screens/change_password/change_password.dart';
import '../screens/new_password/new_password.dart';
import 'routes.dart';

getRoutes() {
  return {
    Routes.homeScreen: (context) => const MyHomeScreen(),
    Routes.loginScreen: (context) => const LoginScreen(),
    Routes.signupScreen: (context) => const SignUpScreen(),
    Routes.forgotPasswordScreen: (context) => const NewPasswordScreen(),
    Routes.changePasswordScreen: (context) => const ChangePasswordScreen(),
    Routes.otpScreen: (context) => const OTPScreen(),
  };
}
