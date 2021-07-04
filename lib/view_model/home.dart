import 'package:flutter/material.dart';
import 'package:list_view_ogp/model/commonaly/header.dart';
import 'package:webview_flutter/webview_flutter.dart';



class Home extends StatelessWidget {
  final String screenName = 'ホーム'; //headerに表示される名前
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(headerTitle: screenName),
      body: const WebView(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}