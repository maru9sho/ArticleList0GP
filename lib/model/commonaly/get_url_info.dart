import 'package:flutter/cupertino.dart';
import 'package:list_view_ogp/model/commonaly/get_meta_data.dart';
import 'package:list_view_ogp/model/commonaly/web_scraping.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:provider/src/provider.dart';




class MetadataTag {
  final String title = null;
  final String image = null;
  final String description = null;
  final String web_title = null;
}

abstract class getUrlInfo {
  Widget getWebTitle(BuildContext context);
  Widget getWebImage(BuildContext context);
  Widget getWebDescription(BuildContext context);
  

}

 class ArticleListsItem implements getUrlInfo {
  Metadata _listitem;
  ArticleListsItem(this._listitem);

  @override
  Widget getWebTitle(BuildContext context) {
    return Text(
        _listitem.title
            ?? "No title",
        style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
    );
  }

  @override
  Widget getWebImage(BuildContext context) {
    return Image.network(
        _listitem.image ?? const Text('No Image')
    );
  }

  @override
  Widget getWebDescription(BuildContext context) {
    return Text(
      _listitem.description?? "",style: const TextStyle(
        fontWeight: FontWeight.normal,fontSize: 8),
    );
  }


  }



