import 'package:flutter/material.dart';
import 'package:list_view_ogp/model/article/article_header.dart';
import 'package:list_view_ogp/model/commonaly/web_scraping.dart';
import 'package:list_view_ogp/model/commonaly/web_view.dart';
import 'package:provider/provider.dart';



class articleView extends StatefulWidget {

  articleView(this.url);
  final String url ;

  @override
  State<articleView> createState() => _articleViewState();
}

class _articleViewState extends State<articleView> {
  final String screenName = 'おすすめFX会社';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: articleHeader(headerTitle: screenName),
      body:  ChangeNotifierProvider(
        create: (context) => WebScrapingModel()..scraping(widget.url),
          child: WebScraping(widget.url)),
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
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}