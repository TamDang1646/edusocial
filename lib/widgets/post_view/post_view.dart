import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/Model/Posts.dart';
import 'package:my_app/log/logger.dart';

import '../../constains/mock_data.dart';
import '../../utils/app_utils.dart';
import '../avatar/avatar.dart';

class PostView extends StatefulWidget {
  const PostView({this.post, this.onTap}) : super();
  final post;
  final Function()? onTap;
  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late Posts _post;
  late bool _liked;
  @override
  void initState() {
    _post = widget.post;
    _liked = false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (_post.images != null) {
    //   LoggerCustom().logInfo(_post.images![0].url);
    // }
    return InkWell(
      onTap: widget.onTap ??
          () {
            print("tap");
          },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Responsive.scale(8, context),
          horizontal: Responsive.scale(4, context),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.scale(16, context),
            vertical: Responsive.scale(8, context),
          ),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Avatar(
                    url: _post.avatar!,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Responsive.scale(MediaQuery.of(context).size.width * 2 / 4, context),
                          //   decoration: BoxDecoration(border: Border.all()),
                          child: RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text: _post.userName,
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                              children: [
                                if (_post.postAddress != null)
                                  TextSpan(
                                      text: ' is in ',
                                      style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                                      children: [
                                        TextSpan(
                                          text: _post.postAddress,
                                          style: const TextStyle(fontWeight: FontWeight.w600),
                                        ),
                                      ]),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          _post.postTime!,
                          style: TextStyle(
                            fontSize: Responsive.scale(11, context),
                            color: const Color.fromRGBO(144, 149, 160, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    width: Responsive.scale(40, context),
                    child: InkWell(
                      hoverColor: Colors.red,
                      onTap: () {
                        print("more");
                      },
                      child: const Icon(Icons.more_vert_outlined),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Responsive.scale(16, context)),
                child: Text(
                  _post.title ?? "",
                  style: TextStyle(
                    fontSize: Responsive.scale(14, context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (_post.images != null && _post.images!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Responsive.scale(16, context),
                  ),
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                        autoPlay: true,
                        height: Responsive.scale(200, context),
                        aspectRatio: 2.0,
                        enlargeCenterPage: true),
                    itemCount: _post.images?.length,
                    itemBuilder: (context, index, realIdx) {
                      return buildImages(_post.images![index].url);
                    },
                  ),
                ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      print("22");
                      setState(() {
                        _liked = !_liked;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          _liked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                          size: Responsive.scale(18, context),
                          color: _liked ? Colors.pink[200] : Colors.black,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _post.like.toString(),
                          style: TextStyle(fontSize: Responsive.scale(14, context)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      print("22");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.comment_outlined,
                          size: Responsive.scale(18, context),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          (_post.comment ?? []).length.toString(),
                          style: TextStyle(fontSize: Responsive.scale(14, context)),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  InkWell(
                    onTap: () {
                      print("22");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.share_outlined,
                          size: Responsive.scale(18, context),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          (_post.share ?? 0).toString(),
                          style: TextStyle(fontSize: Responsive.scale(14, context)),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImages(url) => Container(
        width: 300,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xff1f005c),
              Color(0xff5b0060),
              Color(0xff870160),
              Color(0xffac255e),
              Color(0xffca485c),
              Color(0xffe16b5c),
              Color(0xfff39060),
              Color(0xffffb56b),
            ],
            tileMode: TileMode.mirror,
          ),
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ),
        child: Image(
          image: NetworkImage(url),
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        ),
      );
}