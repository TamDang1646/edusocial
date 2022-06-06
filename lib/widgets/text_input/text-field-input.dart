import 'package:flutter/material.dart';
import 'package:my_app/utils/app_utils.dart';

class TextInputCustom extends StatefulWidget {
  const TextInputCustom({
    Key? key,
    this.label,
    this.hintLabel,
    this.height = 50,
    this.width = 330,
    this.obscureText = false,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixPress,
    required this.controller,
    this.onChange,
  }) : super(key: key);
  final String? label;
  final String? hintLabel;
  final double height;
  final double width;
  final bool obscureText;
  final Icon? icon;
  final Icon? prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixPress;
  final TextEditingController controller;
  final Function(String)? onChange;
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
    return Container(
      width: Responsive.scale(widget.width, context),
      height: Responsive.scale(widget.height, context),
      child: TextFormField(
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
            onPressed: widget.suffixPress,
            icon: Icon(widget.suffixIcon),
            iconSize: 20,
            highlightColor: Colors.amber,
          ),
        ),
        obscureText: widget.obscureText,
        onChanged: widget.onChange,
      ),
    );
  }
}
