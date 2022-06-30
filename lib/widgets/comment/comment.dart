import 'package:edusocial/widgets/avatar/avatar.dart';
import 'package:edusocial/widgets/text_input/text-field-input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Model/Comment.dart';
import '../../utils/app_utils.dart';

class CommentRender extends StatefulWidget {
  const CommentRender({super.key, required this.comment});
  final Comment comment;
  @override
  State<CommentRender> createState() => _CommentRenderState();
}

class _CommentRenderState extends State<CommentRender> {
  late Comment _comment;
  var _liked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _comment = widget.comment;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Container(
        //   padding: EdgeInsets.all(16),
        // decoration: BoxDecoration(border: Border.all()),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Avatar(
                  url: _comment.userAvatar!,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: "${_comment.userName} ",
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          children: [
                            if (_comment.title != null)
                              TextSpan(
                                text: _comment.title,
                                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          _comment.createAt!,
                          style: const TextStyle(color: Color.fromRGBO(1, 1, 1, 0.6), fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "${_comment.like!} like",
                          style: const TextStyle(color: Color.fromRGBO(1, 1, 1, 0.6), fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Reply",
                          style: TextStyle(color: Color.fromRGBO(1, 1, 1, 0.6), fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    print("22");
                    setState(() {
                      _liked = !_liked;
                    });
                  },
                  child: Icon(
                    _liked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                    size: Responsive.scale(16, context),
                    color: _liked ? Colors.pink[200] : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
