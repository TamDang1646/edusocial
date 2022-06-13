import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_app/Model/Posts.dart';
import 'package:my_app/widgets/post_view/post_view.dart';

class PostScrollView extends StatefulWidget {
  const PostScrollView({required this.data}) : super();
  final Future<List<Posts>> data;
  @override
  State<PostScrollView> createState() => _ScrollViewInfiniteState();
}

class _ScrollViewInfiniteState extends State<PostScrollView> {
  static const _pageSize = 10;

  final PagingController<int, Posts> _pagingController = PagingController(firstPageKey: 0);
  @override
  void initState() {
    // _pagingController.addPageRequestListener((pageKey) {
    //   _fetchPage(pageKey);
    // });
    super.initState();
  }

  int _fetchPage(int pageKey) {
    return _pageSize + pageKey * 10;
  }

  @override
//   Widget build(BuildContext context) => PagedListView<int, Posts>(
//         pagingController: _pagingController,
//         builderDelegate: PagedChildBuilderDelegate<Posts>(
//             itemBuilder: (context, item, index) => PostView(
//                   post: item,
//                 )),
//       );
  Widget build(BuildContext context) => FutureBuilder(
      future: widget.data,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
              itemCount: _fetchPage(1),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return PostView(
                  post: snapshot.data[index],
                );
              });
        }
      });
  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
