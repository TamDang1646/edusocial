import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_app/utils/app_utils.dart';

import '../../widgets/avatar/avatar.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("home");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: Responsive.scale(60, context),
              padding: EdgeInsets.symmetric(horizontal: Responsive.scale(16, context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Avatar(
                      // name: "abv",
                      ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("My Name",
                      style: TextStyle(
                        fontSize: Responsive.scale(18, context),
                        fontWeight: FontWeight.bold,
                      )),
                  const Expanded(child: SizedBox()),
                  Center(
                    child: Ink(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          size: Responsive.scale(22, context),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Responsive.scale(100, context),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(248, 249, 250, 1),
              ),
              child: Row(),
            )
          ],
        ),
      ),
    );
  }
}
