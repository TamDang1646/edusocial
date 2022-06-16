import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/widgets.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NeumorphismButton extends StatefulWidget {
  const NeumorphismButton({
    super.key,
    this.padding = 16.0,
    this.borderRadius = 10,
    this.spreadRadius = 1,
    this.blurRadius = 10,
    this.offset = 4,
    this.buttonColor,
    this.topLeftColor,
    this.bottomRightColor,
    required this.icon,
    required this.onTap,
    this.width = 100,
    this.height = 100,
    this.title,
    this.titleStyle,
  });
  final double? width;
  final double? height;
  final double padding;
  final double borderRadius;
  final double spreadRadius;
  final double blurRadius;
  final double offset;
  final Color? buttonColor;
  final Color? topLeftColor;
  final Color? bottomRightColor;
  final Icon icon;
  final Function onTap;
  final String? title;
  final TextStyle? titleStyle;
  @override
  State<NeumorphismButton> createState() => _NeumorphismButtonState();
}

class _NeumorphismButtonState extends State<NeumorphismButton> {
  late double? _width;
  late double? _height;
  late double _padding;
  late double _borderRadius;
  late double _spreadRadius;
  late double _blurRadius;
  late double _offset;
  late Color? _buttonColor;
  late Color? _topLeftColor;
  late Color? _bottomRightColor;
  late Icon _icon;
  late Function _onTap;
  late Offset _offsetShadow;
  late String? _title;
  bool isPressed = false;
  late TextStyle? _titleStyle;
  @override
  void initState() {
    _width = widget.width;
    _height = widget.height;
    _padding = widget.padding;
    _borderRadius = widget.borderRadius;
    _blurRadius = widget.blurRadius;
    _offset = widget.offset;
    _icon = widget.icon;
    _spreadRadius = widget.spreadRadius;
    _bottomRightColor = widget.bottomRightColor;
    _buttonColor = widget.buttonColor;
    _topLeftColor = widget.topLeftColor;
    _onTap = widget.onTap;
    _title = widget.title;
    _titleStyle = widget.titleStyle;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isPressed ? _offsetShadow = Offset(_offset * 2, _offset * 2) : _offsetShadow = Offset(_offset, _offset);
    return Padding(
      padding: EdgeInsets.all(_padding),
      child: GestureDetector(
        // onTap: _onTap(),
        // //   print("ss")
        // ,
        onTap: () {
          setState(() {
            isPressed = !isPressed;
          });
          _onTap();
        },
        child: Listener(
          onPointerDown: (_) => setState(() {
            isPressed = !isPressed;
          }),
          child: AnimatedContainer(
              duration: const Duration(microseconds: 100),
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_borderRadius),
                color: _buttonColor ?? const Color(0xFFE7ECEF),
                boxShadow: [
                  BoxShadow(
                    blurRadius: _blurRadius,
                    offset: -_offsetShadow,
                    color: _bottomRightColor ?? Colors.white,
                    inset: isPressed,
                    spreadRadius: _spreadRadius,
                  ),
                  BoxShadow(
                    blurRadius: _blurRadius,
                    offset: _offsetShadow, // changes position of shadow
                    color: _topLeftColor ?? const Color(0xFFA7A9AF),
                    inset: isPressed,
                    spreadRadius: _spreadRadius,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _icon,
                  const SizedBox(height: 8),
                  if (_title != null)
                    Text(
                      _title!,
                      style: _titleStyle ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                ],
              )),
        ),
      ),
    );
  }
}
