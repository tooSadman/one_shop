import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_f/Pages/creating_shop_intro/instagram_integration.dart';
import 'package:project_f/UI/titled_text_in_shop_creating.dart';

class IntroCreatingShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Text(
          "СТВОРЕННЯ МАГАЗИНУ",
          style: new TextStyle(color: Colors.black, fontSize: 15.0),
        ),
        elevation: 0.0,
        centerTitle: true,
        leading: new IconButton(
          color: Colors.black,
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 20.0),
            child: new Image.asset(
              "images/hipster.png",
              width: 250.0,
            ),
            alignment: Alignment.center,
          ),
          new TitledTextInShopCreating(
              "Лише декілька кроків до мети!",
              "Створюй свій власний магазин, імпортуй товари з Instagram, збільшуй продажі та кількість клієнтів!"),
          new Padding(
            padding: new EdgeInsets.only(top: 64.0),
            child: new CupertinoButton(
              child: new Text(
                "ПОЧИНАЄМО",
                style: new TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: new EdgeInsets.fromLTRB(100.0, 16.0, 100.0, 16.0),
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new InstagramIntegrationPage())),
              color: Colors.black,
              pressedOpacity: 0.5,
              borderRadius: new BorderRadius.circular(4.0),
            ),
          )
        ],
      ),
    );
  }
}
