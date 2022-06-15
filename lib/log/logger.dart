import 'dart:developer';

import 'package:logger/logger.dart';

class LoggerCustom {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  var loggerNoStack = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: true,
      printTime: true,
      //   noBoxingByDefault: true,
    ),
  );
  void logInfo(log) {
    loggerNoStack.i(log);
  }

  void logError(log) {
    loggerNoStack.e(log);
  }

  void logWarning(log) {
    loggerNoStack.w(log);
  }

  LoggerCustom.log({String title = "", required Object object}) {
    logInfo(title);
    inspect(object);
  }
}
