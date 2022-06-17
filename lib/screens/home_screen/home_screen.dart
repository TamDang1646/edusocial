import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Model/Posts.dart';
import 'package:my_app/Model/User.dart';
import 'package:my_app/constains/mock_data.dart';
import 'package:my_app/services/user/user_service.dart';
import 'package:my_app/utils/app_utils.dart';
import 'package:my_app/widgets/avatar/avatar_name.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../widgets/scrollview_infinite/home_posts_view.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final _listTimeLineKey = GlobalKey();
  final _listPostKey = GlobalKey();
//   final _pagingController =

  var post;

  @override
  void initState() {
    // TODO: implement initState
    post = PostServices().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("home");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: FutureBuilder<User>(
                future: UserService().getUser(),
                builder: (context, snapshot) {
                  return Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Hello ",
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Dancing_Script",
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                          children: [
                            WidgetSpan(
                              child: GradientText(
                                "${snapshot.data?.userName!}!",
                                colors: const [Colors.pink, Colors.orange],
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            )
                            // TextSpan(
                            //   text: "${snapshot.data?.userName!}!",
                            // ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: Responsive.scale(100, context),
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const AvatarName(item: {'name': 'You', 'localUrl': 'assets/images/add.png'}),
                        Expanded(
                          child: ListView.builder(
                            key: _listTimeLineKey,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return AvatarName(
                                item: mockTimeline[index],
                                isCircle: false,
                              );
                            },
                            itemCount: mockTimeline.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PostScrollView(
                    data: post,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
