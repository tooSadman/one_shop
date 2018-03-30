import 'package:flutter/material.dart';

///
/// Create by Nikita Kiselov
///

class NumberTextWidget extends StatelessWidget {
  String _text;
  String _number;

  NumberTextWidget(this._text, this._number);

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.only(bottom: 4.0),
          child: new Text(
            _number,
            style: new TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ),
        new Text(
          _text,
          style: new TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
