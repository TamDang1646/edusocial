import 'package:flutter/material.dart';
import 'package:my_app/utils/app_utils.dart';

class Style {
  static InputDecoration textFieldStyle(
      {String labelTextStr = "",
      String hintTextStr = "",
      double paddingAll = 12,
      double borderRadiusCircular = 10,
      double height = 50}) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(paddingAll),
      labelText: labelTextStr,
      hintText: hintTextStr,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadiusCircular),
      ),
    );
  }
}
