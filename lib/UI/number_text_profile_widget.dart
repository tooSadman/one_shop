import 'package:flutter/material.dart';

class NumberTextWidget extends StatelessWidget {

  String _text;
  String _number;


  NumberTextWidget(this._text, this._number);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.only(bottom: 4.0),
          child: new Text(
            _number,
            style: new TextStyle(
              fontSize: 20.0
            ),
          ),
        ),
        new Text(
          _text,
          style: new TextStyle(
              fontSize: 20.0
          ),
        ),
      ],
    );
  }
}
