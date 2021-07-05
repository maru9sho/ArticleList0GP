import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:http/http.dart' as http;

Map<String, dynamic> _ogp = {
  "title": null,
  "image": null,
  "description":null,
};

class MetadataModel extends ChangeNotifier {
  Metadata ogp = Metadata.fromJson(_ogp);
  List<Metadata> OGP =[];

  void fetchOgpFrom(String _url) async {

    final response = await http.get(Uri.parse(_url));
    final document = MetadataFetch.responseToDocument(response);
    ogp = MetadataParser.openGraph(document);
    OGP.add(ogp);
    notifyListeners();
  }
}