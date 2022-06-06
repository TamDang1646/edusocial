import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class Responsive {
  static scale(double size, BuildContext context) {
    // print(MediaQuery.of(context).size.width * size / (Platform.isIOS ? 375 : 400));
    return MediaQuery.of(context).size.width * size / (Platform.isIOS ? 375 : 400);
  }
}
