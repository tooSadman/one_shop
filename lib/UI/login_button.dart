import 'package:flutter/material.dart';
class LoginButton extends StatelessWidget {

  VoidCallback _onTap;
  LoginButton(this._onTap);


  @override
  Widget build(BuildContext context) {
    return new Material(
        child: new GestureDetector(
          onTap: _onTap,
          child: new Row(
            children: <Widget>[
              new Icon(Icons.search),
              new Text("instagram",
                textAlign: TextAlign.center,
              )
            ],
          )
        )
    );
  }



}