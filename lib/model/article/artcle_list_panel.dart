import 'package:flutter/material.dart';
import 'package:list_view_ogp/model/article/article_view.dart';
import 'package:list_view_ogp/model/commonaly/get_meta_data.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';




class articleListPanel extends StatelessWidget {
  articleListPanel(this._URL);
  final List<String> _URL;

  @override
  Widget build(BuildContext context) {
    //List<String> _uRL =[_url1,_url2];
    // _URL.add(_url);
    //final List<int> n = [];
    final success = context.watch<MetadataModel>().fetchOgpFrom(_URL[0]);
    Metadata _ogp = context.select((MetadataModel _model) => _model.ogp);
    List<Metadata> _setOgp = [];
    _setOgp.add(_ogp);

    void setOgp (){
      for (var i = 0; i < _URL.length; i++) {

      }
    }

    return ListView.builder(
        itemCount: _URL.length,
        itemBuilder: (context,n){
          return _URL[n]
              != null
              ? ListTile(
                title: Text(_URL[n].toString()),
              )
              : Container(
                height: 0,
                 width: 0,
              );
          },
        );


      /*
    return ListView.builder(
      itemCount: _URL.length,
        itemBuilder: (context,n){
          return InkWell(
            onTap: () async {
              String url = _URL[n];
              if (await canLaunch(url)) {
                Navigator.push(context, MaterialPageRoute(
                    builder:(context)
                    =>  articleView(url)));
              } else {
                throw 'Could not launch $url';
              }},
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
                          _setOgp[n].title ?? "No title",
                          //_ogp.title ?? "No title",
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
                      child:
                      Image.network(
                          _setOgp[n].image
                        //_ogp.image ?? noImagePath
                      ),
                    ),]
              ),
            ),
          );
    });

       */
    /*
    return InkWell(
          onTap: () async {
            String url = _URL[n];
            if (await canLaunch(url)) {
              Navigator.push(context, MaterialPageRoute(
                  builder:(context)
                  =>  articleView(url)));
            } else {
              throw 'Could not launch $url';
            }},
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
                        _OGP[n].title ?? "No title",
                        //_ogp.title ?? "No title",
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
                    child:
                    Image.network(
                      _OGP[n].image ?? noImagePath
                      //_ogp.image ?? noImagePath
                    ),
                  ),]
            ),
          ),
        );
 */
  }
}
