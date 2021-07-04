import 'package:flutter/material.dart';
import 'package:list_view_ogp/model/article/article_header.dart';
import 'package:list_view_ogp/model/commonaly/web_scraping.dart';
import 'package:list_view_ogp/model/commonaly/web_view.dart';
import 'package:provider/provider.dart';



class articleView extends StatelessWidget {
  final String screenName = 'おすすめFX会社';//headerに表示される名前
  articleView(this.url);
  final String url ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: articleHeader(headerTitle: screenName),
      body:  Scrollbar(
          child: ChangeNotifierProvider(
            create: (context) => WebScrapingModel(),
              child: WebScraping(url)),
      ),
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
}