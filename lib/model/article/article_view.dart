import 'dart:async';

import 'package:flutter/material.dart';
import 'package:list_view_ogp/model/article/article_header.dart';
import 'package:webview_flutter/webview_flutter.dart';



class articleView extends StatefulWidget {

  articleView(this.url);
  final String url ;

  @override
  State<articleView> createState() => _articleViewState();
}

class _articleViewState extends State<articleView> {
  final String screenName = 'おすすめFX会社';
  WebViewController _myController;
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: articleHeader(headerTitle: screenName),
          body: WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              _myController = controller;
            },
            onPageFinished: (initialUrl) {
              _myController.evaluateJavascript(
                  "document.getElementsByClassName('article-header')[0].style.display='none';document.getElementsByClassName('mobile-footer-menu-buttons')[0].style.display='none';");
            },
          )
        /*
        body:  ChangeNotifierProvider(
          create: (context) => WebScrapingModel()..scraping(widget.url),
            child: WebScraping(widget.url)),
         */
        /*
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
            ],
          ),*/

      ),
    );
  }
}
