import 'package:flutter/material.dart';
import 'package:list_view_ogp/model/commonaly/header.dart';
import 'package:list_view_ogp/model/article/artcle_list_panel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:list_view_ogp/model/commonaly/get_meta_data.dart';



class ArticleLists extends StatelessWidget {
  //headerに表示される名前
  final String screenName = '記事一覧';

  //url一覧暫定
  final List<String> _URL = [
    'https://fx-app.net/gakushuu-1/',
    'https://fx-app.net/gakushuu-2/',
    'https://fx-app.net/gakushuu-3/',
    'https://fx-app.net/gakushuu-4/',
  ];

  @override
  Widget build(BuildContext context) {
    //final Metadata _ogp = context.select((MetadataModel _model) => _model.ogp);

    return Scaffold(
        appBar: Header(headerTitle: screenName),
        body: Scrollbar(
            child: ChangeNotifierProvider(
                create: (context) => MetadataModel(_URL)..fetchOgpFrom(),
                child: articleListPanel(_URL))
          ),
    );
  }
}
