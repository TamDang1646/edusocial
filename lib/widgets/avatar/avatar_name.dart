import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/utils/app_utils.dart';
import 'package:my_app/widgets/avatar/avatar.dart';

class AvatarName extends StatelessWidget {
  const AvatarName({super.key, required this.item, this.onTap, this.isCircle = true});
  final dynamic item;
  final Function()? onTap;
  final bool isCircle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 80,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, right: 10.0),
        child: InkWell(
          onTap: onTap ??
              () {
                print("item: $item");
              },
          child: Column(
            children: [
              Avatar(
                url: item!['avatarUrl'] ?? "",
                localUrl: item!['localUrl'] ?? "",
                width: 60,
                height: 60,
                isCircle: isCircle,
              ),
              SizedBox(
                height: Responsive.scale(10, context),
              ),
              Text(
                item!['name'],
                style: TextStyle(fontSize: Responsive.scale(14, context)),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
