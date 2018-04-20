import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_f/Pages/creating_shop_intro/adding_info.dart';

class InstagramIntegrationPage extends StatelessWidget {
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
            padding: new EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 16.0),
            child: new Image.asset(
              "images/hart.png",
              width: 200.0,
            ),
            alignment: Alignment.center,
          ),
          new Text(
            "Є сторінка бренду в Instagram?",
            textAlign: TextAlign.center,
            style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 8.0),
            child: new Text(
              "Під'єднюй акаунт, імпортуй фото власних товарів, кількість лайків, "
                  "відгуки користувачів та хештеги",
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 14.0),
            ),
          ),
          new Padding(
              padding: new EdgeInsets.fromLTRB(16.0, 64.0, 16.0, 16.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new CupertinoButton(
                    child: new Text(
                      "ПОЧИНАЄМО",
                      style: new TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: new EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
                    onPressed: () => Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new InstagramIntegrationPage())),
                    color: Colors.black,
                    pressedOpacity: 0.5,
                    borderRadius: new BorderRadius.circular(4.0),
                  ),
                  new Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(4.0),
                      border: new Border.all(
                        color: Colors.black,
                        width: 2.0
                      )
                    ),
                    child: new CupertinoButton(
                      child: new Text(
                        "НЕ  ЗАРАЗ",
                        style: new TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      padding: new EdgeInsets.fromLTRB(38.0, 14.0, 38.0, 14.0),
                      onPressed:() => Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) =>
                          new AddingInfoPage())),
                      color: Colors.white,
                      pressedOpacity: 0.5,
                      borderRadius: new BorderRadius.circular(4.0),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
