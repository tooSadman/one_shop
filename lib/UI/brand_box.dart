import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_f/Pages/shop_page.dart';

class BrandBox extends StatelessWidget {
  String _logoUrl;
  String _shopAbout;
  String _shopName;
  String _documentID;

  BrandBox(this._logoUrl, this._shopAbout, this._shopName, this._documentID);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(16.0),
      child: new Container(
        padding: new EdgeInsets.all(32.0),
        decoration: new BoxDecoration(color: new Color.fromRGBO(0, 0, 0, 0.05)),
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.all(8.0),
                        child: _logoUrl != null
                            ? new Image(
                          image: new CachedNetworkImageProvider(_logoUrl),
                          fit: BoxFit.cover,
                          width: 40.0,
                        )
                            : new Container(),
                      ),
                      new Text(
                        _shopName,
                        style: new TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                new GestureDetector(
                  child: new Icon(Icons.arrow_forward, color: Colors.black),
                  onTap: () {
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                          new ShopPage(_documentID)
                      ),
                    );
                  },
                )

              ],
            ),
            new Container(
              padding: new EdgeInsets.all(8.0),
              child: new Text(
                _shopAbout,
                style:
                new TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
      ),
    );
  }
}
