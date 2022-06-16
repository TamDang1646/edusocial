import 'package:flutter/material.dart';

class Responsive {
  static scale(double size, BuildContext context) {
    // print(MediaQuery.of(context).size.width * size / (Platform.isIOS ? 375 : 400));
    return size;
  }
}
