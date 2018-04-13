import 'package:flutter/material.dart';

class BrandBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(16.0),
      child: new Container(
        padding: new EdgeInsets.all(32.0),
        decoration: new BoxDecoration(color: new Color.fromRGBO(0, 0, 0, 0.05)),
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.all(8.0),
                        child: new Image.asset("images/sammy_icon.png"),
                      ),
                      new Text(
                        "Sammy Icon",
                        style: new TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                new Icon(Icons.arrow_forward, color: Colors.black)
              ],
            ),
            new Container(
              padding: new EdgeInsets.all(8.0),
              child: new Text(
                "Ми робимо речі, з яких починається твій стиль."
                    " І робимо їх класно!",
                style:
                    new TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
      ),
    );
  }
}
