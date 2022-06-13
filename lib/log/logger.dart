import 'package:logger/logger.dart';

class LoggerCustom {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
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
}
