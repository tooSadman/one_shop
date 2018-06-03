import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_f/UI/titled_text_in_shop_creating.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlankSearchPage extends StatelessWidget {
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
              Icons.settings,
              color: Colors.grey,
              size: 200.0,
            ),
            alignment: Alignment.center,
          ),
          new TitledTextInShopCreating("Вибачте(",
              "Ця сторінка знаходиться на стадії розробки"),
        ],
      ),
    );
  }
}
