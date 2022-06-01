import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_app/routes/routes.dart';
import 'package:my_app/screens/login_screen/login_screen.dart';
import 'package:my_app/screens/signup_screen/signup_screen.dart';

import 'routes/screen_stack.dart';
import 'screens/home_screen/home_screen.dart';

void main() {
//   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final isLogin = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.loginScreen,
      routes: MainStack(context).stackScreen,
    );
  }
}
