import 'package:flutter/material.dart';
import 'package:my_app/screens/home_screen/home_screen.dart';
import 'package:my_app/screens/login_screen/login_screen.dart';
import 'package:my_app/screens/signup_screen/signup_screen.dart';

import 'routes.dart';

List<Route<dynamic>> defaultGenerateInitialRoutes(String initialRouteName) {
  List<MaterialPageRoute> routes = [];
  routes.add(MaterialPageRoute(builder: (context) => const MyHomeScreen()));
  routes.add(MaterialPageRoute(builder: (context) => const LoginScreen()));
  routes.add(MaterialPageRoute(builder: (context) => const SignUpScreen()));
  return routes;
}

class MainStack {
  MainStack(BuildContext context) : super();
  var stackScreen = {
    Routes.homeScreen: (context) => const MyHomeScreen(),
    Routes.loginScreen: (context) => const LoginScreen(),
    Routes.signupScreen: (context) => const SignUpScreen(),
  };
}
