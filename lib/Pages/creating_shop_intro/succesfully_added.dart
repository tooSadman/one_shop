import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_f/UI/titled_text_in_shop_creating.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuccessfullyAddedPage extends StatelessWidget {
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
          new TitledTextInShopCreating("Твій магазин створено!",
              "Залишилось лише додати товари, поділити їх по категоріях та поділиитись посиланням на магазин з клієнтами."),
          new Padding(
            padding: new EdgeInsets.only(top: 64.0),
            child: new CupertinoButton(
              child: new Text(
                "ПЕРЕЙТИ В МАГАЗИН",
                style: new TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: new EdgeInsets.fromLTRB(100.0, 16.0, 100.0, 16.0),
              onPressed: () {
                _settingPreferenceData();
                return Navigator.of(context).pushNamed("/shop_page");
              },
              color: Colors.black,
              pressedOpacity: 0.5,
              borderRadius: new BorderRadius.circular(4.0),
            ),
          )
        ],
      ),
    );
  }

  Future _settingPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("shop_is_created", true);
  }
}
