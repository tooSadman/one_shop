import 'package:flutter/material.dart';
class TextPriceTextColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
      child: new Column(
        children: <Widget>[
          new Text(
            "Шкарпетки Ester",
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          new Text(
            "60 uah",
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