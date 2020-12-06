import 'package:flutter/material.dart';

class SliverSearchBar extends StatelessWidget {
  final Widget title;
  final VoidCallback resetImages;

  const SliverSearchBar({
    Key key,
    @required this.title,
    @required this.resetImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: title,
      backgroundColor: Colors.white,
      actions: [buildIconButtonReset],
    );
  }

  Widget get buildIconButtonReset {
    return IconButton(
      icon: Icon(Icons.close),
      color: Colors.black87,
      onPressed: resetImages,
    );
  }
}
