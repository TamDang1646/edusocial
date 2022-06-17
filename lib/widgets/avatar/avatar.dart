import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/utils/app_utils.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.localUrl,
    this.showBorder = false,
    this.isCircle = true,
    this.borderColor,
  }) : super(key: key);
  final String url;
  final String? localUrl;
  final double? width;
  final double? height;
  final bool showBorder;
  final bool isCircle;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: isCircle
          ? showBorder
              ? ShapeDecoration(
                  shape: CircleBorder(
                    side: BorderSide(width: 3, color: borderColor ?? Colors.blue),
                  ),
                )
              : const BoxDecoration()
          : BoxDecoration(
              //   border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.green,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.clamp,
              ),
            ),
      width: Responsive.scale(width ?? 40, context),
      height: Responsive.scale(height ?? 40, context),
      child: isCircle
          ? CircleAvatar(
              backgroundImage: url.isNotEmpty ? NetworkImage(url) : AssetImage(localUrl!) as ImageProvider,
              // foregroundColor: Colors.black,
              //   backgroundImage: NetworkImage(url),
            )
          : Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // border: Border.all(width: 1, color: Colors.blue),
                shape: BoxShape.rectangle,
              ),
              child: Image(
                image: url.isNotEmpty ? NetworkImage(url) : AssetImage(localUrl!) as ImageProvider,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
    );
  }
}
