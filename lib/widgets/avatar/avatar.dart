import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/utils/app_utils.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key, required this.url, this.width, this.height, this.localUrl}) : super(key: key);
  final String url;
  final String? localUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.scale(width ?? 40, context),
      height: Responsive.scale(height ?? 40, context),
      child: CircleAvatar(
        backgroundImage: url.isNotEmpty ? NetworkImage(url) : AssetImage(localUrl!) as ImageProvider,
        //   backgroundImage: NetworkImage(url),
      ),
    );
  }
}
