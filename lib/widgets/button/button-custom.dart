import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.colour = Colors.blue,
    this.boxDecoration,
    this.height,
    this.width,
    this.textStyle,
  }) : super(key: key);
  final double? width;
  final double? height;
  final Color colour;
  final String title;
  final VoidCallback onPressed;
  final BoxDecoration? boxDecoration;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            decoration: boxDecoration,
            width: width ?? 200.0,
            height: height ?? 42.0,
            child: Center(
              child: Text(
                title,
                style: textStyle ??
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
