import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  final String headerTitle;
  Header({this.headerTitle}); //ヘッダータイトルを変更できるようにする
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(headerTitle),
      actions: [],
    );
  }
}