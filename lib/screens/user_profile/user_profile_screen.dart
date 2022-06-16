import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/Model/Posts.dart';
import 'package:my_app/services/user/user_service.dart';
import 'package:my_app/widgets/avatar/avatar.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Colors.orange, Colors.red],
  ).createShader(const Rect.fromLTRB(0.0, 0.0, 2.0, 2.0));
  var post;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    post = PostServices().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      // shape:  RoundedRectangleBorder(
      //     borderRadius:
      // ),
      elevation: 0,
    );
    return Scaffold(
      // backgroundColor: ,
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        // reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ShaderMask(
                  shaderCallback: (rectangle) {
                    return const LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(
                      Rect.fromLTRB(0, 0, rectangle.width, rectangle.height - 20),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image(
                    image:
                        const NetworkImage("https://i.pinimg.com/564x/1f/82/85/1f82857bcb41dbb60d9cc27bbca38a06.jpg"),
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).viewPadding.top + appBar.preferredSize.height,
                        //   decoration: BoxDecoration(border: Border.all()),
                      ),
                      const Avatar(
                        url: "https://i.pinimg.com/564x/1f/82/85/1f82857bcb41dbb60d9cc27bbca38a06.jpg",
                        width: 120,
                        height: 120,
                        showBorder: true,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Đặng Tâm",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(4),
                        width: MediaQuery.of(context).size.width * 3 / 4,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(1, 1, 1, 0.1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                GradientText(
                                  "553",
                                  colors: colorArrays,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "Posts",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    //   color: Colors.pink,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                GradientText(
                                  "2444",
                                  colors: colorArrays,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "Followers",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    //   color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                GradientText(
                                  "553",
                                  colors: colorArrays,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "Following",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    //   color: Colors.purple,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            renderEduInfo(context),
            renderProfileInfo(context),
            renderFriends(context),
          ],
        ),
      ),
      //   const AppBarCustom(),
    );
  }
}

const colorArrays = <Color>[
  Colors.pink,
  Colors.pink,
//   Colors.blue,
//   Colors.red,
];

Widget renderEduInfo(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Stack(children: [
      Container(
        padding: const EdgeInsets.all(16),
        // height: 200,
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red.shade50,
              Colors.red.shade100,
              Colors.pink.shade50,
              Colors.pink.shade100,
              Colors.blue.shade50,
              Colors.blue.shade100,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          //   color: const Color(0xFFE7ECEF),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(-4, -4),
              color: Colors.white,
              spreadRadius: 1,
            ),
            BoxShadow(
              blurRadius: 5,
              offset: Offset(4, 4),
              color: Color(0xFFA7A9AF),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: "Họ và tên: ",
                style: TextStyle(
                    color: Colors.black54, fontSize: 20, fontFamily: "Dancing_Script", fontWeight: FontWeight.bold),
                children: [TextSpan(text: "Đặng Tâm", style: TextStyle(color: Colors.black, fontSize: 22))],
              ),
            ),
            const SizedBox(height: 4),
            RichText(
              text: const TextSpan(
                text: "Mã sinh viên: ",
                style: TextStyle(
                    color: Colors.black54, fontSize: 20, fontFamily: "Dancing_Script", fontWeight: FontWeight.bold),
                children: [TextSpan(text: "1851060083", style: TextStyle(color: Colors.black, fontSize: 22))],
              ),
            ),
            const SizedBox(height: 4),
            RichText(
              text: const TextSpan(
                text: "Khoa: ",
                style: TextStyle(
                    color: Colors.black54, fontSize: 20, fontFamily: "Dancing_Script", fontWeight: FontWeight.bold),
                children: [TextSpan(text: "Công nghệ thông tin", style: TextStyle(color: Colors.black, fontSize: 22))],
              ),
            ),
            const SizedBox(height: 4),
            RichText(
              text: const TextSpan(
                text: "Lớp: ",
                style: TextStyle(
                    color: Colors.black54, fontSize: 20, fontFamily: "Dancing_Script", fontWeight: FontWeight.bold),
                children: [TextSpan(text: "60TH3", style: TextStyle(color: Colors.black, fontSize: 22))],
              ),
            ),
            const SizedBox(height: 4),
            RichText(
              text: const TextSpan(
                text: "Niên khoá: ",
                style: TextStyle(
                    color: Colors.black54, fontSize: 20, fontFamily: "Dancing_Script", fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "2018-2023",
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
      Positioned(
        top: 8,
        right: 8,
        child: IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
      )
    ]),
  );
}

Widget renderProfileInfo(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Stack(children: [
      Container(
        padding: const EdgeInsets.all(16),
        // height: 200,
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.shade50,
              Colors.green.shade100,
              Colors.yellow.shade50,
              Colors.yellow.shade100,
              Colors.purple.shade50,
              Colors.purple.shade100,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          //   color: const Color(0xFFE7ECEF),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(-4, -4),
              color: Colors.white,
              spreadRadius: 1,
            ),
            BoxShadow(
              blurRadius: 5,
              offset: Offset(4, 4),
              color: Color(0xFFA7A9AF),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                // text: "Họ và tên: ",
                style: TextStyle(
                    color: Colors.black54, fontSize: 20, fontFamily: "Dancing_Script", fontWeight: FontWeight.bold),
                children: [
                  WidgetSpan(
                    child: Icon(FontAwesomeIcons.briefcase, size: 20),
                  ),
                  WidgetSpan(
                      child: SizedBox(
                    width: 10,
                  )),
                  TextSpan(
                    text: "Software engineer",
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  )
                ],
              ),
            ),
            const SizedBox(height: 4),
            RichText(
              text: const TextSpan(
                // text: "Họ và tên: ",
                style: TextStyle(
                    color: Colors.black54, fontSize: 20, fontFamily: "Dancing_Script", fontWeight: FontWeight.bold),
                children: [
                  WidgetSpan(
                    child: Icon(Icons.business, size: 20),
                  ),
                  WidgetSpan(
                      child: SizedBox(
                    width: 10,
                  )),
                  TextSpan(
                    text: "Làm việc tại Hà Nội",
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  )
                ],
              ),
            ),
            const SizedBox(height: 4),
            RichText(
              text: const TextSpan(
                // text: "Họ và tên: ",
                style: TextStyle(
                    color: Colors.black54, fontSize: 20, fontFamily: "Dancing_Script", fontWeight: FontWeight.bold),
                children: [
                  WidgetSpan(
                    child: Icon(Icons.location_city, size: 20),
                  ),
                  WidgetSpan(
                      child: SizedBox(
                    width: 10,
                  )),
                  TextSpan(
                    text: "Quê quán Ninh Bình",
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  )
                ],
              ),
            ),
            const SizedBox(height: 4),
            RichText(
              text: const TextSpan(
                // text: "Họ và tên: ",
                style: TextStyle(
                    color: Colors.black54, fontSize: 20, fontFamily: "Dancing_Script", fontWeight: FontWeight.bold),
                children: [
                  WidgetSpan(
                    child: Icon(Icons.school, size: 20),
                  ),
                  WidgetSpan(
                      child: SizedBox(
                    width: 10,
                  )),
                  TextSpan(
                    text: "DHTL",
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  )
                ],
              ),
            ),
            const SizedBox(height: 4),
            RichText(
              text: const TextSpan(
                // text: "Họ và tên: ",
                style: TextStyle(
                    color: Colors.black54, fontSize: 20, fontFamily: "Dancing_Script", fontWeight: FontWeight.bold),
                children: [
                  WidgetSpan(
                    child: Icon(Icons.phone, size: 20),
                  ),
                  WidgetSpan(
                      child: SizedBox(
                    width: 10,
                  )),
                  TextSpan(
                    text: "0399493924",
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  )
                ],
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
      Positioned(
        top: 8,
        right: 8,
        child: IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
      )
    ]),
  );
}

Widget renderFriends(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Stack(children: [
      Container(
        padding: const EdgeInsets.all(16),
        // height: 200,
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [
          //       Colors.green.shade50,
          //       Colors.green.shade100,
          //       Colors.yellow.shade50,
          //       Colors.yellow.shade100,
          //       Colors.purple.shade50,
          //       Colors.purple.shade100,
          //     ],
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //   ),
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          //   color: const Color(0xFFE7ECEF),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(-4, -4),
              color: Colors.white,
              spreadRadius: 1,
            ),
            BoxShadow(
              blurRadius: 5,
              offset: Offset(4, 4),
              color: Color(0xFFA7A9AF),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Friends",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            FutureBuilder(
              future: UserService().getUser(),
              builder: ((context, snapshot) => Container(
                    width: 60,
                    height: 60,
                    color: Colors.amber,
                  )),
            )
          ],
        ),
      ),
      Positioned(
        top: 8,
        right: 8,
        child: IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
      )
    ]),
  );
}
