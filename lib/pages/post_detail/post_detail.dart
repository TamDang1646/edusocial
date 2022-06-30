import 'package:edusocial/Model/Comment.dart';
import 'package:edusocial/Model/Posts.dart';
import 'package:edusocial/Model/User.dart';
import 'package:edusocial/constains/app_colors.dart';
import 'package:edusocial/services/user/user_service.dart';
import 'package:edusocial/utils/app_utils.dart';
import 'package:edusocial/widgets/avatar/avatar.dart';
import 'package:edusocial/widgets/comment/comment.dart';
import 'package:edusocial/widgets/post_view/post_view.dart';
import 'package:edusocial/widgets/text_input/text-field-input.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key});
//   final Posts postDetail;
  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  late Posts _post;
  late List<Comment> _comment;
  final _pageSize = 10;
  int _fetchPage(int pageKey) {
    if (_comment.length <= _pageSize + pageKey * 10) {
      return _comment.length;
    } else {
      return _pageSize + pageKey * 10;
    }
  }

  final _inputCommentController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _inputCommentController.addListener(() {
      final String text = _inputCommentController.text.toLowerCase();
      _inputCommentController.value = _inputCommentController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _inputCommentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _post = (ModalRoute.of(context)!.settings.arguments as PostDetailState).postDetail;
    _comment = _post.comment!;
    // LoggerCustom.log(title: "_user", object: _user);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //   SizedBox(
            //     height: MediaQuery.of(context).viewPadding.top,
            //   ),
            PostView(
              post: _post,
            ),
            FutureBuilder<User>(
                future: UserService().getUser(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      color: Colors.white,
                    ),
                    // width: MediaQuery.of(context).size.width - 20,
                    child: Row(
                      children: [
                        Avatar(url: snapshot.data!.avatar!),
                        const SizedBox(
                          width: 16,
                        ),
                        TextInputCustom(
                          controller: _inputCommentController,
                          width: Responsive.scale(MediaQuery.of(context).size.width - 120, context),
                          hintLabel: "Write a comment...",
                        ),
                      ],
                    ),
                  );
                }),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _fetchPage(1),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return CommentRender(
                  comment: _comment[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PostDetailState {
  final Posts postDetail;
  const PostDetailState({required this.postDetail});
}
