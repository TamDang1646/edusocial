import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, this.name});
  final String? name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Column(
        children: const [
          CircleAvatar(
            backgroundImage:
                NetworkImage("https://img.websosanh.vn/v2/users/review/images/4wvuq0i4ozs1q.jpg?compress=85"),
          ),
          // if (name != null) Text(name!)
        ],
      ),
    );
  }
}
