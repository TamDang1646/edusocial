import 'package:flutter/material.dart';
import 'package:my_app/components/style.dart';
import 'package:my_app/utils/app_utils.dart';

class TextInputCustom extends StatefulWidget {
  const TextInputCustom({Key? key, String label = "", String hintLabel = "", double height = 40}) : super(key: key);

  @override
  State<TextInputCustom> createState() => _TextInputCustomState();
}

class _TextInputCustomState extends State<TextInputCustom> {
  var _border;
//   double _height = Responsive.scale(this.heigh,);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: Style.textFieldStyle(),
    );
  }
}
