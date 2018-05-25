import 'package:flutter/material.dart';

/// 
///  Create by sin_maminoy_podrugi  
///

class SettingsItem extends StatelessWidget {
  final String _itemTitle;
  final IconData _itemIcon;
  final String _itemText;
  final VoidCallback _onTap;

  SettingsItem(this._itemIcon, this._itemTitle, this._itemText, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      child: new Material(
          color: Colors.grey[200],
          child: new InkWell(
              onTap: () => _onTap(),
              child: new Center(
                child: new Padding(
                    padding: new EdgeInsets.fromLTRB(15.0, 18.0, 15.0, 18.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Icon(
                          _itemIcon,
                          size: 25.0,
                        ),
                        new Padding(
                            padding: new EdgeInsets.only(left: 20.0),
                            child: new Text(
                              _itemTitle,
                              style: new TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            )),
                        new Expanded(
                            child: new Text(
                          _itemText,
                          style: new TextStyle(
                              fontSize: 15.0, color: Colors.grey[500]),
                          textAlign: TextAlign.right,
                        ))
                      ],
                    )),
              ))),
    );
  }
}
