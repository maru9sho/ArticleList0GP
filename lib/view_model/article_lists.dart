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
            create: (context) => MetadataModel(),
            child: articleListPanel(_URL)
                /*
            ListView(
              children: <Widget>[
                //この箱が記事の数だけ存在。読み取り先はfire base??
                articleListPanel(_url1),
                articleListPanel(_url2),
                InkWell(
                  onTap: () async {
                    const url = 'https://fx-app.net/gakushuu-10/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Ink(
                    height: 150,
                    color: Colors.green[200],
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Container(
                              width: double.maxFinite,
                              height: double.maxFinite,
                              margin: EdgeInsets.all(2),
                              //padding: EdgeInsets.all(20),
                              //color: Colors.blue[200],
                              child: Text('記事タイトル'),
                            ),
                          ),
                          Container(
                            width: 150,
                            height:double.maxFinite,
                            margin: EdgeInsets.all(2),
                            //padding: EdgeInsets.all(20),
                            //color: Colors.green[200],
                            child: Text('記事関連画像（アスペクト比1:1'),
                          ),]
                    ),
                  ),
                ),
              ],
            ),

                 */
          ),
        )
    );
  }
}
