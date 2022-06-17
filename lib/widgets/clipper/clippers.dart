import 'package:flutter/material.dart';

class ClippersMenu extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(0, size.height - 60, 60, size.height - 60);
    path.quadraticBezierTo(60, size.height - 60, size.width - 60, size.height - 60);
    path.quadraticBezierTo(size.width, size.height - 60, size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    // throw UnimplementedError();
    print(oldClipper);
    return true;
  }
}
