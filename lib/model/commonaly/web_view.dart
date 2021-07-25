import 'package:flutter/material.dart';
import 'package:list_view_ogp/model/commonaly/web_scraping.dart';
import 'package:provider/provider.dart';



class WebScraping extends StatefulWidget {
  WebScraping(this._url);
  final String _url;

  @override
  State<WebScraping> createState() => _WebScrapingState();
}

class _WebScrapingState extends State<WebScraping> {
  @override
  Widget build(BuildContext context) {
    final success = context.watch<WebScrapingModel>().scraping(widget._url);
    var _text = context.select((WebScrapingModel _model) => _model.result);
    final item = _text;

    return Scrollbar(child: Text('$item'));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
