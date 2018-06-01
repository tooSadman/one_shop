import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_f/Pages/adding_product_page.dart';
import 'package:project_f/Pages/creating_shop_intro/intro_creating.dart';
import 'package:project_f/UI/number_text_profile_widget.dart';
import 'package:project_f/UI/vertical_divider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:project_f/Pages/home_pages/settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Create by Nikita Kiselov
///

class ProfilePage extends StatefulWidget {
  String _name;
  String _photoUrl;

  ProfilePage(this._name, this._photoUrl);

  @override
  State<StatefulWidget> createState() {
    return new ProfilePageState(_name, _photoUrl);
  }
}

class ProfilePageState extends State<ProfilePage> {
  String _name;
  String _photoUrl;
  String _dynamicString;
  bool _shopIsCreated = false;
  bool _isLoading = true;

  ProfilePageState(this._name, this._photoUrl);

  @override
  Widget build(BuildContext context) {
    _settingPreferenceData();
    if(_isLoading){
      return new Material(
        child: new Center(
          child: new CircularProgressIndicator(

          ),
        ),
      );
    }
    else {
      return new Scaffold(
          body: new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Center(
                  child: new Padding(
                    padding: new EdgeInsets.only(top: 32.0),
                    child: new CircleAvatar(
                      backgroundImage: new CachedNetworkImageProvider(
                          _photoUrl),
                      backgroundColor: Colors.black,
                      minRadius: 45.0,
                      maxRadius: 45.0,
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.only(bottom: 4.0),
                        child: new Text(
                          _name,
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
                    padding: new EdgeInsets.only(top: 24.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(left: 16.0, right: 8.0),
                          child: new CupertinoButton(
                            child: new Text(
                              "НАЛАШТУВАННЯ",
                              style: new TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            padding: new EdgeInsets.fromLTRB(
                                16.0, 16.0, 16.0, 16.0),
                            onPressed: () =>
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                        new SettingsPage())),
                            color: Colors.black,
                            pressedOpacity: 0.5,
                          ),
                        ),
                        new Padding(
                            padding: new EdgeInsets.only(
                                left: 8.0, right: 16.0),
                            child: new Container(
                              decoration: new BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(10.0)),
                                  border: new Border.all(
                                      color: Colors.black, width: 2.0)),
                              child: new CupertinoButton(
                                color: Colors.white,
                                child: new Text(
                                  _dynamicString,
                                  style: new TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                padding:
                                new EdgeInsets.fromLTRB(10.0, 14.0, 10.0, 14.0),
                                onPressed: () =>
                                !_shopIsCreated
                                    ? Navigator
                                    .of(context)
                                    .pushNamed("/intro_creating")
                                    : Navigator
                                    .of(context)
                                    .pushNamed("/shop_page"),
                                pressedOpacity: 0.5,
                              ),
                            )),
                      ],
                    ))
              ],
            ),
          ));
    }
  }

  Future _settingPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _shopIsCreated = prefs.get("shop_is_created");
      _dynamicString = _shopIsCreated ? "ПЕРЕЙТИ В МАГАЗИН" : "СТВОРИТИ МАГАЗИН";
    });
    _isLoading = false;
  }
}
