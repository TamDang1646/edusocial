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
    this.borderColor,
  }) : super(key: key);
  final String url;
  final String? localUrl;
  final double? width;
  final double? height;
  final bool showBorder;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: showBorder
          ? ShapeDecoration(
              shape: CircleBorder(
                side: BorderSide(width: 3, color: borderColor ?? Colors.blue),
              ),
            )
          : const BoxDecoration(),
      width: Responsive.scale(width ?? 40, context),
      height: Responsive.scale(height ?? 40, context),
      child: CircleAvatar(
        backgroundImage: url.isNotEmpty ? NetworkImage(url) : AssetImage(localUrl!) as ImageProvider,
        // foregroundColor: Colors.black,
        //   backgroundImage: NetworkImage(url),
      ),
    );
  }
}
