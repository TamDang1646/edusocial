import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_app/routes/routes.dart';
import 'package:my_app/screens/login_screen/login_screen.dart';

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
        initialRoute: isLogin ? Routes.home_screen : Routes.login_screen,
        debugShowCheckedModeBanner: false,
        routes: {
          Routes.home_screen: (context) => const MyHomeScreen(),
          Routes.login_screen: (context) => const LoginScreen(),
        });
  }
}
