import 'package:flutter/material.dart';
import 'package:my_app/utils/app_utils.dart';

class TextInputCustom extends StatefulWidget {
  const TextInputCustom(
      {Key? key,
      this.label = "",
      this.hintLabel = "",
      this.height = 40,
      this.obscureText = false,
      this.icon,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixPress,
      required this.controller})
      : super(key: key);
  final String label;
  final String hintLabel;
  final double height;
  final bool obscureText;
  final Icon? icon;
  final Icon? prefixIcon;
  final IconData? suffixIcon;
  final Function? suffixPress;
  final TextEditingController controller;
  @override
  State<TextInputCustom> createState() => _TextInputCustomState();
}

class _TextInputCustomState extends State<TextInputCustom> {
  late TextEditingController _controller = widget.controller;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

//   double _height = Responsive.scale(this.heigh,);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16),
        labelText: widget.label,
        hintText: widget.hintLabel,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        icon: widget.icon,
        prefixIcon: widget.prefixIcon,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(widget.suffixIcon),
          iconSize: 20,
          highlightColor: Colors.amber,
        ),
      ),
      obscureText: widget.obscureText,
    );
  }
}
