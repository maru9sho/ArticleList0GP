import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:http/http.dart' as http;

Map<String, dynamic> _ogp = {
  "title": null,
  "image": null,
  "description":null,
  "url":null,
};

class webInform{
  webInform(this.title);
  String title;
}

class MetadataModel extends ChangeNotifier {
  MetadataModel(this._url);
  final List<String> _url;

  List<Metadata> docs = []; //外部から参照するためのまとめ
  List<Metadata> _docs = []; // データ格納

  Future fetchOgpFrom() async {
    for (int i = 0; i< _url.length; i++) {
      ///
      final response = await http.get(Uri.parse(_url[i]));
      final document = MetadataFetch.responseToDocument(response);
      var ogp = MetadataParser.openGraph(document);
      ///
      var data = await MetadataFetch.extract(_url[i]);
      var dataAsMap = data.toMap();
      ///
      this._docs.add(ogp);
    }

    this.docs = _docs;
    notifyListeners();
  }
}


/*
class getMetadataModel extends StatefulWidget {
  getMetadataModel(this._Url);
  final String _Url;

  @override
  State<getMetadataModel> createState() => _getMetadataModelState();
}

class _getMetadataModelState extends State<getMetadataModel> {
  Metadata ogp = null;

  List<Metadata> OGP = [];

  @override
  Widget build(BuildContext context) {
     fetchOgpFrom() async {
      final response = await http.get(Uri.parse(widget._Url));
      final document = MetadataFetch.responseToDocument(response);
      ogp = MetadataParser.openGraph(document);
      }
      setState(() {
        OGP.add(ogp);
      });
    Navigator.of(context).pop(ogp);

  }
}

 */


