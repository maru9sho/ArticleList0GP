import 'package:flutter/material.dart';

class articleHeader extends StatelessWidget with PreferredSizeWidget {
  final String headerTitle;
  articleHeader({this.headerTitle}); //ヘッダータイトルを変更できるようにする
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(headerTitle),
      actions: [
        /* Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              //押したときの処理
            },
          ),
        )*/
      ],
    );
  }
}