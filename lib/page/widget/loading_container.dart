import 'package:flutter/material.dart';

///页面渲染前的loading
class LoadingContainer extends StatelessWidget {
  final Widget child; //页面内容
  final bool isLoading; //是否在加载
  final bool cover; //主体内容是否覆盖loading 默认不覆盖

  const LoadingContainer(
      {Key key,
      @required this.child,
      @required this.isLoading,
      this.cover = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !cover
        ? (!isLoading ? child : _loadingView)
        : Stack(
            children: <Widget>[
              child,
              isLoading ? _loadingView : Container(),
            ],
          );
  }

  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
