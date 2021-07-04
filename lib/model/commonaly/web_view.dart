import 'package:flutter/material.dart';
import 'package:list_view_ogp/model/commonaly/web_scraping.dart';
import 'package:provider/provider.dart';



final noImagePath =
    "https://www.shoshinsha-design.com/wp-content/uploads/2016/10/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88-2016-10-05-0.41.12.png";

class WebScraping extends StatelessWidget {
  WebScraping(this._url);
  final String _url;

  @override
  Widget build(BuildContext context) {
    final success = context.watch<WebScrapingModel>().scraping(_url);
    final _text = context.select((WebScrapingModel _model) => _model.result);

    return Container(
      padding: EdgeInsets.all(10),
      child: Text('$_text'),
    );
  }
}
