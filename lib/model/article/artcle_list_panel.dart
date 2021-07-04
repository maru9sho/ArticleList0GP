import 'package:flutter/material.dart';
import 'package:list_view_ogp/model/article/article_view.dart';
import 'package:list_view_ogp/model/commonaly/get_meta_data.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


final noImagePath =
    "https://www.shoshinsha-design.com/wp-content/uploads/2016/10/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88-2016-10-05-0.41.12.png";


class articleListPanel extends StatelessWidget {
  articleListPanel(this._url);
  final String _url;

  @override
  Widget build(BuildContext context) {
    final success = context.watch<MetadataModel>().fetchOgpFrom(_url);
    final Metadata _ogp = context.select((MetadataModel _model) => _model.ogp);

    return InkWell(
          onTap: () async {
            String url = _url;
            if (await canLaunch(url)) {
              Navigator.push(context, MaterialPageRoute(
                  builder:(context)
                  =>  articleView(url)));
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Container(
            height: 150,
            //color: Colors.green[200],
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
                      child:
                      Text(
                        _ogp.title ?? "No title",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height:double.maxFinite,
                    margin: EdgeInsets.all(2),
                    //padding: EdgeInsets.all(20),
                    //color: Colors.green[200],
                    child: Image.network(_ogp.image ?? noImagePath),
                  ),]
            ),
          ),
        );
  }
}
