import 'package:edusocial/Model/Posts.dart';
import 'package:edusocial/routes/routes.dart';
import 'package:edusocial/screens/post_detail/post_detail.dart';
import 'package:edusocial/widgets/post_view/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostScrollView extends StatefulWidget {
  const PostScrollView({required this.data}) : super();
  final Future<List<Posts>> data;
  @override
  State<PostScrollView> createState() => _ScrollViewInfiniteState();
}

class _ScrollViewInfiniteState extends State<PostScrollView> {
  static const _pageSize = 10;
  late ScrollController scrollController;
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
  Widget build(BuildContext context) => FutureBuilder(
      future: widget.data,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _fetchPage(1),
              //   scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return PostView(
                  post: snapshot.data[index],
                  onTap: () => Navigator.pushNamed(
                    context,
                    Routes.postDetailScreen,
                    arguments: PostDetailState(postDetail: snapshot.data[index]),
                  ),
                );
              },
            ),
          );
        }
      });
  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
