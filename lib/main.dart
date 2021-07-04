import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:list_view_ogp/view_model/article_lists.dart';
import 'package:list_view_ogp/model/commonaly/bottom_navigation_model.dart';
import 'package:list_view_ogp/view_model/home.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List _pageList = [
    Home(),
    ArticleLists(),

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '本気でFX', //アプリの名前
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: ChangeNotifierProvider<BottomNavigationModel>(
        create: (_) => BottomNavigationModel(),
        child:
        Consumer<BottomNavigationModel>(builder: (context, model, child) {
          return Scaffold(
            // appBar: Header(), //各ファイルでHeader()を実行するのでいらない
            body: _pageList[model.currentIndex], //中身を描画
            //footer部分
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'ホーム',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.article_outlined),
                  label: '記事一覧',
                ),
              ],
              currentIndex: model.currentIndex,
              onTap: (index) {
                model.currentIndex = index;
              },
              selectedItemColor: Colors.pinkAccent, //選んだ物の色
              unselectedItemColor: Colors.black45, //選んでない物の色
            ),
          );
        }),
      ),
    );
  }
}
