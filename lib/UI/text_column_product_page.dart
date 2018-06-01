import 'package:flutter/material.dart';
class TextPriceTextColumn extends StatelessWidget {
  String _name;
  String _price;

  TextPriceTextColumn(this._name, this._price);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
      child: new Column(
        children: <Widget>[
          new Text(
            _name,
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          new Text(
            _price + " uah",
            style: new TextStyle(
                fontSize: 16.0, color: new Color.fromRGBO(0, 0, 0, 0.3)),
            textAlign: TextAlign.left,
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

}