import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_f/Pages/home_page.dart';
import 'package:project_f/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

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
      //TODO add COLUMN from tutorial
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
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new CupertinoButton(
                        child: new Text("Увійти через Google"),

                        color: Colors.greenAccent,
                        pressedOpacity: 0.5,
                        onPressed: _onClickGoogleAuth
                    ),
                    new CupertinoButton(
                        child: new Text("Увійти через Facebook"),

                        color: Colors.blueAccent,
                        pressedOpacity: 0.5,
                        onPressed: _onClickFacebookAuth
                    ),
                  ],
                )
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
      GoogleSignInAuthentication credentials = await googleSignIn.currentUser.authentication;
      firebaseUser = await auth.signInWithGoogle( //new
        idToken: credentials.idToken, //new
        accessToken: credentials.accessToken, //new
      );
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new HomePage()));
    }
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new HomePage()));
  }

  Future _onClickFacebookAuth() async {
    firebaseUser = await auth.currentUser();

    final FacebookLoginResult result =
        await facebookSignIn.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
          firebaseUser = await auth.signInWithFacebook(accessToken: result.accessToken.token);
          debugPrint(firebaseUser.email);
        break;
      case FacebookLoginStatus.cancelledByUser:
        debugPrint('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        debugPrint('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }
}