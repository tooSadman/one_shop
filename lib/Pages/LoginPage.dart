import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_f/main.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginPageState();
  }

}

class LoginPageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blue,
      child: new Container(
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(top: 100.0, bottom: 20.0),
              child: new Text(
                "ONE:SHOP", textAlign: TextAlign.center,
                style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0
                ),
              ),),
            new Center(
              //TODO creat class for button
              child: new CupertinoButton(
                  child: new Text("Увійти через Google"),

                  color: Colors.greenAccent,
                  pressedOpacity: 0.5,
                  onPressed: _onClickGoogleAuth
              ),
            ),
            new Padding(
                padding: new EdgeInsets.only(bottom: 120.0),
                child: new Text("Це на 100% безпечніше ніж орігамі!",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 15.0
                  ),
                )
            ),
            new Container(

            )

          ],
        ),
      ),
    );
  }


  Future _onClickGoogleAuth() async {
    GoogleSignInAccount user = googleSignIn.currentUser;
    if (user == null)
      user = await googleSignIn.signInSilently();
    if (user == null) {
      await googleSignIn.signIn();
      //TODO add analytics analytics.logLogin();
    }
    if (await auth.currentUser() == null) { //new
      GoogleSignInAuthentication credentials = //new
      await googleSignIn.currentUser.authentication; //new
      await auth.signInWithGoogle( //new
        idToken: credentials.idToken, //new
        accessToken: credentials.accessToken, //new
      );
      
    }
  }
}