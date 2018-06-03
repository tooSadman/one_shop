import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:project_f/UI/settings_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
///  Create by sin_maminoy_podrugi
///

class SettingsPage extends StatefulWidget {
  @override
  State createState() => new SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  bool _notification = false;
  bool _shopIsCreated = false;
  bool _isLoading = false;

  void changeNotificationStatus(bool status) {
    status == true
        ? this.setState(() {
            _notification = false;
          })
        : this.setState(() {
            _notification = true;
          }); // if clause
  }

  @override
  Widget build(BuildContext context) {
    _settingPreferenceData();
    Widget settingsSection = new Container(
        padding: new EdgeInsets.only(top: 6.0),
        //color: Colors.red,
        //child: new Padding( padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _shopIsCreated ? new SettingsItem(
                Icons.add_box,
                "Додати товар",
                "натисни щоб перейти",
                () => Navigator.of(context).pushNamed("/adding_product")) : new Container(),
            new SettingsItem(Icons.person, "Ім'я", "Нікіта", () => print("")),
            new SettingsItem(Icons.create, "Про себе", "Привіт! Я продаю..",
                () => print("")),
            new SettingsItem(Icons.email, "Пошта", "no_blockchain@kinivi.net",
                () => print("")),
            new SettingsItem(Icons.loyalty, "Мої категорії", "Книги, орігамі",
                () => print("")),
            new SettingsItem(
                _notification == true
                    ? Icons.notifications_active
                    : Icons.notifications_off,
                "Сповіщення",
                _notification == true ? "Увімкнено" : "Вимкнено",
                () => changeNotificationStatus(_notification)),
            new SettingsItem(Icons.help, "Допомога", "Маєш питання", () {}),
            new SettingsItem(
                Icons.info, "Про проект", "ver. 0.5.1", () => print("")),
            new SettingsItem(Icons.format_quote, "Умови та конфіденційність",
                "", () => print("")),
          ],
        ));

    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: new Text(
            "НАЛАШТУВАННЯ",
            style: new TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          elevation: 0.0,
          centerTitle: true,
          leading: new IconButton(
            color: Colors.black,
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: new ListView(children: [settingsSection]));
  }

  Future _settingPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _shopIsCreated = prefs.get("shop_is_created");
      debugPrint(_shopIsCreated.toString());
    });
    _isLoading = false;
  }
}
