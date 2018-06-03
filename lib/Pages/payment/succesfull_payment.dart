import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_f/UI/titled_text_in_shop_creating.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuccessfullyPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.fromLTRB(8.0, 100.0, 8.0, 20.0),
            child: new Icon(
              Icons.check,
              color: new Color.fromRGBO(10, 199, 117, 1.0),
              size: 170.0,
            ),
            alignment: Alignment.center,
          ),
          new TitledTextInShopCreating("УСПІШНО!",
              "Вітаємо! Платіж пройшов успішно, найближчим часом з вами зв'яжеться представник магазину!"),
          new Padding(
            padding: new EdgeInsets.only(top: 64.0),
            child: new CupertinoButton(
              child: new Text(
                "ПЕРЕЙТИ НА ГОЛОВНУ",
                style: new TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              padding: new EdgeInsets.fromLTRB(100.0, 16.0, 100.0, 16.0),
              onPressed: () {
                while(Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
                return Navigator.of(context).pushNamed("/home_page");
              },
              color: new Color.fromRGBO(10, 199, 117, 1.0),
              pressedOpacity: 0.5,
              borderRadius: new BorderRadius.circular(4.0),
            ),
          )
        ],
      ),
    );
  }
}
