import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

Map<String, dynamic> mockJson = {
  "mainEntityOfPage":null,
};

class WebScrapingModel extends ChangeNotifier {
  List result;

  Future scraping(String url) async {
    final target = Uri.parse(url);
    final response = await http.get(target);
    if (response.statusCode != 200) {
      print('ERROR: ${response.statusCode}');
      return;
    }
    final document = parse(response.body);
    final _result = document.getElementsByClassName('entry-content cf').map((v) => v.text).toList();
    //final _result = document.querySelectorAll('#post-6 > div > p:nth-child(1)').map((v) => v.text).toList();

    this.result = _result;
    notifyListeners();
  }



}
