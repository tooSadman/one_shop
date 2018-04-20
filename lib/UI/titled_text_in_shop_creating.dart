import 'package:flutter/material.dart';

class TitledTextInShopCreating extends StatelessWidget {
  String _title;
  String _text;

  TitledTextInShopCreating(this._title, this._text);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Text(
          _title,
          textAlign: TextAlign.center,
          style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        new Padding(
          padding: new EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 8.0),
          child: new Text(
            _text,
            textAlign: TextAlign.center,
            style: new TextStyle(fontSize: 14.0),
          ),
        ),
      ],
    );
  }
}
