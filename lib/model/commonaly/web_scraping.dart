import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

Map<String, dynamic> mockJson = {
  "h2":null,

};

class WebScrapingModel extends ChangeNotifier {
  List result;

  void scraping(String url) async {
    final target = Uri.parse(url);
    final response = await http.get(target);
    if (response.statusCode != 200) {
      print('ERROR: ${response.statusCode}');
      return;
    }
    final document = parse(response.body);
    final result = document.querySelectorAll('h2').map((v) => v.text).toList();
    notifyListeners();
  }



}
