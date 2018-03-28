import 'package:flutter/material.dart';
import 'package:project_f/UI/number_text_profile_widget.dart';

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
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: new CircleAvatar(
              backgroundImage: new AssetImage("box.png"),
              minRadius: 45.0,
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(bottom: 4.0),
                  child: new Text("Павло Зібров",
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

          new Padding(padding: new EdgeInsets.only(),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new NumberTextWidget("Товарів", "5"),
              new Divider(
                height: 13.0,
                indent: 4.0,
                color: Colors.grey,
              ),
              new NumberTextWidget("Підписок", "19"),
              new NumberTextWidget("Підписників", "4"),
            ],
          ),
          ),
        ],
      ),
    );
  }

}