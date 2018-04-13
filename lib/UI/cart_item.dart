import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String _cartItemTitle;
  final String _assetCartImage;
  final String _cartItemPrice;
  final VoidCallback _onPressed;

  CartItem(this._assetCartImage, this._cartItemTitle, this._cartItemPrice,
      this._onPressed);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
      child: new Material(
          borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
          color: Colors.grey[200],
          child: new InkWell(
            onLongPress: () => _onPressed(),
            child: new Center(
                child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.fromLTRB(17.0, 10.0, 25.0, 10.0),
                  child: new Material(
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(10.0)),
                      child: new Image.asset(
                        _assetCartImage,
                        width: 100.0,
                        height: 100.0,
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.cover,
                      )),
                ),
                new Expanded(
                    child: new Padding(
                  padding: new EdgeInsets.fromLTRB(10.0, 25.0, 25.0, 25.0),
                  // Right Text Column
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text(_cartItemTitle,
                          style: new TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      new Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Container(
                                padding: new EdgeInsets.only(right: 15.0),
                                child: new Text("Кількість:",
                                    style: new TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.grey[500]))),
                            new DropdownButton<String>(
                              items: <String>["1 p", "2", "3", "4", "5"]
                                  .map((String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            )
                          ]),
                      new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Container(
                                padding: new EdgeInsets.only(right: 10.0),
                                child: new Text("Ціна:   ",
                                    style: new TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.grey[500]))),
                            new Text(_cartItemPrice,
                                style: new TextStyle(
                                    fontSize: 15.0, color: Colors.grey[500]))
                          ])
                    ],
                  ),
                ))
              ],
            )),
          )),
    );
  }
}
