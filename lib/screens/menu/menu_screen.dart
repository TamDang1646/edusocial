import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/Model/User.dart';
import 'package:my_app/routes/routes.dart';
import 'package:my_app/services/user/user_service.dart';
import 'package:my_app/utils/app_utils.dart';

import '../../widgets/avatar/avatar.dart';
import '../../widgets/bottom_bar/bottom_bar.dart';
import '../../widgets/button/neumorphism_button.dart';
import '../../widgets/clipper/clippers.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  stackMenu() {
    return <Widget>[
      NeumorphismButton(
        icon: const Icon(
          FontAwesomeIcons.user,
          size: 30,
        ),
        onTap: () {
          //   print("1");
          Navigator.pushNamed(context, Routes.userProfileScreen);
        },
        title: "Profile",
      ),
      NeumorphismButton(
        icon: const Icon(
          FontAwesomeIcons.userGroup,
          size: 30,
        ),
        onTap: () {
          Navigator.pushNamed(context, Routes.settingScreen);
        },
        title: "Groups",
      ),
      NeumorphismButton(
        icon: const Icon(
          FontAwesomeIcons.gear,
          size: 30,
        ),
        onTap: () {
          Navigator.pushNamed(context, Routes.settingScreen);
        },
        title: "Settings",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          ClipPath(
            clipper: ClippersMenu(),
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top, bottom: 8),
              height: Responsive.scale(MediaQuery.of(context).viewPadding.top + 150, context),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.primaries[10],
                  border: Border.all(),
                  image: const DecorationImage(image: AssetImage("assets/images/profile.png"), fit: BoxFit.cover)
                  // borderRadius: const BorderRadius.only(
                  //   bottomLeft: Radius.circular(50),
                  // ),
                  ),
              child: FutureBuilder<User>(
                  future: UserService().getUser(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const SizedBox();
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Avatar(
                            url: snapshot.data!.avatar!,
                            width: 80,
                            height: 80,
                          ),
                          const SizedBox(width: 16),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.userName!,
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: Responsive.scale(MediaQuery.of(context).size.width - 220, context),
                                child: const Text(
                                  "Moo tar banr thana user nene hieen choo nayf daios oanfas aiwfl faoiwfsdf lawfjadf awai fawidfjalksfj",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, fontFamily: "Joan"),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          IconButton(onPressed: (() {}), icon: const Icon(Icons.settings))
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Colors.transparent),
            margin: EdgeInsets.only(top: Responsive.scale(MediaQuery.of(context).viewPadding.top + 110, context)),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Menu",
                    style: TextStyle(fontSize: 20, fontFamily: "Joan", fontWeight: FontWeight.w700),
                  ),
                  GridView.extent(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    maxCrossAxisExtent: 150,
                    children: stackMenu(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
