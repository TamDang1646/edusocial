import 'package:edusocial/routes/routes.dart';
import 'package:edusocial/utils/app_utils.dart';
import 'package:edusocial/widgets/avatar/avatar.dart';
import 'package:edusocial/widgets/clipper/clippers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    const Key drawerKey = Key("drawer_key");
    var userName = "Dang Tam";
    var userEmail = "abc@gmail.com";
    var routeName = ModalRoute.of(context)!.settings.name;

    return Drawer(
      key: drawerKey,
      width: MediaQuery.of(context).size.width * 3 / 4,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ClipPath(
            clipper: ClippersMenu(),
            child: Container(
              //   padding: EdgeInsets.zero,
              //   padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top, bottom: 8),
              height: Responsive.scale(MediaQuery.of(context).viewPadding.top + 180, context),
              width: MediaQuery.of(context).size.width * 2 / 3,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/profile.png"), fit: BoxFit.cover)),
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top, bottom: 8, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Avatar(
                      url: "https://i.pinimg.com/564x/04/87/79/0487793244e87723a10ef038f893ccac.jpg",
                      height: 90,
                      width: 90,
                      showBorder: true,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 2 / 4 - 20,
                          child: Text(
                            userName,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 2 / 4 - 20,
                          child: Text(
                            userEmail,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
              title: const Text("Home"),
              leading: const Icon(FontAwesomeIcons.houseChimney),
              onTap: () {
                Navigator.pop(context);
                if (routeName != Routes.mainScreen) {
                  Navigator.pushNamed(context, Routes.mainScreen);
                }
              }),
          ListTile(
            title: const Text("Hồ sơ cá nhân"),
            leading: const Icon(FontAwesomeIcons.user),
            onTap: () {
              Navigator.pop(context);
              if (routeName != Routes.userProfileScreen) {
                Navigator.pushNamed(context, Routes.userProfileScreen);
              }
            },
          ),
          ListTile(
            title: const Text("Đổi mật khẩu"),
            leading: const Icon(Icons.key),
            onTap: () {
              Navigator.pop(context);
              if (routeName != Routes.otpScreen) {
                Navigator.pushNamed(context, Routes.otpScreen);
              }
            },
            // shape: ,
          ),
          ListTile(
            title: const Text("Setting"),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              if (routeName != Routes.settingScreen) {
                Navigator.pushNamed(context, Routes.settingScreen);
              }
            },
            // shape: ,
          ),
        ],
      ),
    );
  }
}
