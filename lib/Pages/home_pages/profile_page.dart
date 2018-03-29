import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_f/UI/number_text_profile_widget.dart';
import 'package:project_f/UI/vertical_divider.dart';

///
/// Create by Nikita Kiselov
///

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: new Padding(
              padding: new EdgeInsets.only(top: 40.0),
              child: new CircleAvatar(
                backgroundImage: new AssetImage("images/box.png"),
                minRadius: 45.0,
              ),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(bottom: 4.0),
                  child: new Text(
                    "Павло Зібров",
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  "Привіт! Мене звати Павло Зібров і я вмію співати, танцювати і зваблювати жінок!",
                  style: new TextStyle(
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new NumberTextWidget("Товарів", "5"),
                new VerticalDivider(),
                new NumberTextWidget("Підписок", "19"),
                new VerticalDivider(),
                new NumberTextWidget("Підписників", "4"),
              ],
            ),
          ),
          new Padding(
              padding: new EdgeInsets.only(top: 16.0),
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.only(),
                    child: new CupertinoButton(
                      padding: new EdgeInsets.only(),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Image.asset('images/instagram.png'),
                        ],
                      ),
                      color: Colors.white,
                      pressedOpacity: 0.5,
                      onPressed: null,
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(),
                    child: new CupertinoButton(
                      padding: new EdgeInsets.only(),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Image.asset('images/instagram.png'),
                        ],
                      ),
                      color: Colors.white,
                      pressedOpacity: 0.5,
                      onPressed: null,
                    ),
                  ),
                ],
              ))
        ],
      ),
    ));
  }
}
