import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_f/UI/brand_box.dart';
import 'package:project_f/UI/text_column_product_page.dart';

class ProductPage extends StatefulWidget {
  String documentID;

  ProductPage(this.documentID);

  @override
  State<StatefulWidget> createState() {
    return new ProductPageState(documentID);
  }
}

class ProductPageState extends State<StatefulWidget> {
  String _logoImageUrl;
  Image _productImage;
  String _productName = "";
  String _productPrice = "";
  static String _shopName = "";
  static String _productAbout = "";
  static String _shopAbout = "";
  static String _shopID;

  String documentID;

  var _brandBox;

  bool _isBookmarked = false;
  bool _isLoading = true;

  ProductPageState(this.documentID);

  @override
  void initState() {
    super.initState();
    _settingData();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return new Material(
        child: new Center(
          child: new CircularProgressIndicator(strokeWidth: 15.0),
        ),
      );
    } else {
      return new Theme(
          data: new ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.black,
            primaryColorLight: Colors.black54,
            primaryColorDark: Colors.black,
            platform: Theme.of(context).platform,
          ),
          child: new Scaffold(
              backgroundColor: Colors.white,
              body: new CustomScrollView(
                slivers: <Widget>[
                  new SliverAppBar(
                    expandedHeight: 350.0,
                    pinned: true,
                    actions: <Widget>[
                      new IconButton(
                        icon: _isBookmarked
                            ? new Icon(Icons.bookmark)
                            : new Icon(Icons.bookmark_border),
                        tooltip: 'Edit',
                        onPressed: () {
                          setState(() {
                            _isBookmarked = !_isBookmarked;
                          });
                        },
                      ),
                    ],
                    flexibleSpace: new FlexibleSpaceBar(
                      title: const Text(''),
                      background: new Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          _productImage != null
                              ? _productImage
                              : new Container(),
                          // This gradient ensures that the toolbar icons are distinct
                          // against the background image.
                          const DecoratedBox(
                            decoration: const BoxDecoration(
                              gradient: const LinearGradient(
                                begin: const Alignment(0.0, -1.0),
                                end: const Alignment(0.0, -0.4),
                                colors: const <Color>[
                                  const Color(0x60000000),
                                  const Color(0x00000000)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  new SliverList(
                      delegate: new SliverChildListDelegate(
                    <Widget>[
                      new TextPriceTextColumn(_productName, _productPrice),
                      new Container(
                        padding: new EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Padding(
                              padding: new EdgeInsets.only(right: 8.0),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    "Кількість:",
                                    style: new TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  new Container(
                                    decoration: new BoxDecoration(
                                        border: new Border.all(
                                            color: new Color.fromRGBO(
                                                149, 152, 154, 1.0),
                                            width: 2.0),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(10.0))),
                                    padding: new EdgeInsets.fromLTRB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: new DropdownButton<int>(
                                      items: <int>[0, 1, 2, 3, 4, 5]
                                          .map((int value) {
                                        return new DropdownMenuItem<int>(
                                          value: value,
                                          child: new Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                24.0, 0.0, 24.0, 0.0),
                                            child: new Text('$value шт.'),
                                          ),
                                        );
                                      }).toList(),
//                        value: quantity,
                                      onChanged: null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            new Padding(
                              padding: new EdgeInsets.only(right: 8.0),
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    "Розмір:",
                                    style: new TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  new Container(
                                    decoration: new BoxDecoration(
                                        border: new Border.all(
                                            color: new Color.fromRGBO(
                                                149, 152, 154, 1.0),
                                            width: 2.0),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(10.0))),
                                    padding: new EdgeInsets.fromLTRB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: new DropdownButton<String>(
                                      items: <String>[
                                        "28-30",
                                        "31-33",
                                        "34-36",
                                        "37-40"
                                      ].map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 0.0, 0.0, 0.0),
                                            child: new Text('$value розмір'),
                                          ),
                                        );
                                      }).toList(),
//                        value: quantity,
                                      onChanged: null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      confirmAddToCart,
                      _textForProduct,
                      _brandBox != null ? _brandBox : new Container(),
                    ],
                  ))
                ],
              )));
    }
  }

  Widget confirmAddToCart = new Container(
      margin: new EdgeInsets.fromLTRB(30.0, 16.0, 30.0, 0.0),
      child: new MaterialButton(
          height: 50.0,
          color: Colors.black,
          onPressed: () => {},
          child: new Text(
            "ОФОРМИТИ В КОРЗИНУ",
            style: new TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )));

  Widget _textForProduct = new Container();

  Future _settingData() async {
    DocumentReference documentReference =
        Firestore.instance.collection('goods').document(documentID);
    DocumentSnapshot document = await documentReference.get();
    _productImage = document["photo_url"] != null
        ? new Image(
            image: new CachedNetworkImageProvider(document["photo_url"]),
            fit: BoxFit.cover,
            height: 350.0,
          )
        : null;

    setState(() {
      _productName = document["product_name"];
      _productPrice = document["product_price"];
      _productAbout = document["product_about"];
      _textForProduct = new Container(
        padding: new EdgeInsets.all(16.0),
        child: new Text(
          _productAbout,
          style: new TextStyle(fontSize: 13.0),
        ),
      );
    });

    documentReference = document["shop"];
    document = await documentReference.get();

    setState(() {
      _logoImageUrl = document["logo_url"];
      _shopName = document["name"];
      _shopAbout = document["about"];
      _shopID = document.documentID;

      _brandBox = new BrandBox(_logoImageUrl, _shopAbout, _shopName, _shopID);

      _isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
