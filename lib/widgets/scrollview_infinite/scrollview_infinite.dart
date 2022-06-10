import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ScrollViewInfinite extends StatefulWidget {
  const ScrollViewInfinite({required this.itemBuilder, required this.data}) : super();
  final Widget itemBuilder;
  final Future<List<Object>> data;
  @override
  State<ScrollViewInfinite> createState() => _ScrollViewInfiniteState();
}

class _ScrollViewInfiniteState extends State<ScrollViewInfinite> {
  static const _pageSize = 20;

  final PagingController<int, Object> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      // final newItems = await RemoteApi.getCharacterList(pageKey, _pageSize);
      // final isLastPage = newItems.length < _pageSize;
      // if (isLastPage) {
      //   _pagingController.appendLastPage(newItems);
      // } else {
      //   final nextPageKey = pageKey + newItems.length;
      //   _pagingController.appendPage(newItems, nextPageKey);
      // }
      final newItems = widget.data;
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => PagedListView<int, Object>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Object>(itemBuilder: (context, item, index) => widget.itemBuilder),
      );
//   Widget build(BuildContext context) => ListView.builder(
//         itemBuilder: (context, index) => widget.itemBuilder,
//         itemCount: 10,
//       );
  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
