import 'package:flutter/material.dart';
import 'package:my_app/routes/routes.dart';
import 'package:my_app/routes/screen_stack.dart';

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
      title: 'EduSocial',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.loginScreen,
      routes: getRoutes(),
      theme: ThemeData(fontFamily: "Roboto-Regular"),
      //   supportedLocales: const [
      //     Locale('vi', 'VN'),
      //     Locale('en', 'US'),
      //   ],
      //   localizationsDelegates: const [
      //     AppLocalizations.delegate,
      //     GlobalMaterialLocalizations.delegate,
      //     GlobalWidgetsLocalizations.delegate,
      //   ],
      //   localeResolutionCallback: (locale, supportedLocales) {
      //     for (var supportedLocale in supportedLocales) {
      //       if (supportedLocale.languageCode == locale?.languageCode &&
      //           supportedLocale.countryCode == locale?.countryCode) {
      //         return supportedLocale;
      //       }
      //     }
      //     return supportedLocales.first;
      //   },
    );
  }
}
