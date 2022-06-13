import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_app/Model/Posts.dart';
import 'package:my_app/constains/app_colors.dart';
import 'package:my_app/constains/mock_data.dart';
import 'package:my_app/constains/posts.dart';
import 'package:my_app/log/logger.dart';
import 'package:my_app/utils/app_utils.dart';
import 'package:my_app/widgets/avatar/avatar_name.dart';
import 'package:my_app/widgets/scrollview_infinite/home_posts_view.dart';
import 'dart:developer';
import '../../widgets/avatar/avatar.dart';
import '../../widgets/bottom_bar/bottom_bar.dart';
import '../../widgets/post_view/post_view.dart';

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
      bottomNavigationBar: const BottomBar(),
      body: Container(
        decoration: BoxDecoration(color: AppColors.background),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Container(
              height: Responsive.scale(60, context),
              padding: EdgeInsets.symmetric(horizontal: Responsive.scale(16, context)),
              decoration: BoxDecoration(color: AppColors.background),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Avatar(
                    url: "https://img.websosanh.vn/v2/users/review/images/4wvuq0i4ozs1q.jpg?compress=85",
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
              decoration: BoxDecoration(
                  // border: Border.all(),
                  color: AppColors.gray1),
              child: Row(
                children: [
                  const AvatarName(item: {'name': 'You', 'localUrl': 'assets/images/add.png'}),
                  Expanded(
                    child: ListView.builder(
                      key: _listTimeLineKey,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AvatarName(item: mockTimeline[index]);
                      },
                      itemCount: mockTimeline.length,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                //   padding: EdgeInsets.all(0),
                child: PostScrollView(
              data: post,
            )),
          ],
        ),
      ),
    );
  }
}
