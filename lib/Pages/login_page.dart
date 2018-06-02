import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_f/Pages/home_page.dart';
import 'package:project_f/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Create by Nikita Kiselov
///

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<StatefulWidget> {
  //reference to users in database
  CollectionReference get users => Firestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
            image: new AssetImage('images/login.png'),
            fit: BoxFit.cover,
          )),

          /// Here I`m using builder for context. Its neede to build Toasts.
          /// So in release it's need to refactor
          //TODO decide what to do with builder
          child: new Builder(builder: (BuildContext context) {
            return new Column(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(top: 100.0, bottom: 10.0),
                  child: new Text(
                    "ONE:SHOP",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0),
                  ),
                ),
                new Padding(
                  padding:
                      new EdgeInsets.only(left: 4.0, right: 4.0, bottom: 45.0),
                  child: new Column(
                    children: <Widget>[
                      new Text(
                        "Привіт! Почнімо?",
                        style:
                            new TextStyle(color: Colors.white, fontSize: 15.5),
                      ),
                      new Text(
                        "Заходь до нас через свій улюблений сервіс.",
                        style:
                            new TextStyle(color: Colors.white, fontSize: 15.5),
                      )
                    ],
                  ),
                ),
                new Center(
                    child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(
                          left: 32.0, right: 32.0, bottom: 15.0),
                      child: new CupertinoButton(
                        padding: new EdgeInsets.only(
                            left: 16.0, bottom: 16.0, top: 16.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Image.asset('images/instagram.png'),
                            new Expanded(
                                child: new Text(
                              "Увійти через Instagram",
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  color: new Color.fromRGBO(162, 42, 132, 1.0)),
                            ))
                          ],
                        ),
                        color: Colors.white,
                        pressedOpacity: 0.5,
                        onPressed: () {
                          Scaffold.of(context).showSnackBar(new SnackBar(
                                content: new Text("This feature in develop"),
                              ));
                        },
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(
                          left: 32.0, right: 32.0, bottom: 15.0),
                      //TODO add button to UI
                      child: new CupertinoButton(
                        padding: new EdgeInsets.only(
                            left: 16.0, bottom: 16.0, top: 16.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Image.asset('images/facebook.png'),
                            new Expanded(
                                child: new Text(
                              "Увійти через Facebook",
                              textAlign: TextAlign.center,
                              style: new TextStyle(color: Colors.white),
                            ))
                          ],
                        ),
                        color: new Color.fromRGBO(10, 97, 176, 1.0),
                        pressedOpacity: 0.5,
                        onPressed: _onClickFacebookAuth,
//                          _onClickFacebookAuth
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(
                          left: 32.0, right: 32.0, bottom: 15.0),
                      child: new CupertinoButton(
                          padding: new EdgeInsets.only(
                              left: 16.0, bottom: 16.0, top: 16.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Image.asset('images/google_plus.png'),
                              new Expanded(
                                  child: new Text(
                                "Увійти через Google",
                                textAlign: TextAlign.center,
                                style: new TextStyle(color: Colors.white),
                              ))
                            ],
                          ),
                          color: new Color.fromRGBO(232, 61, 40, 1.0),
                          pressedOpacity: 0.5,
                          onPressed: _onClickGoogleAuth),
                    ),
                  ],
                )),
                new Padding(
                    padding: new EdgeInsets.only(top: 120.0),
                    child: new Text(
                      "Це на 100% безпечніше ніж орігамі!",
                      style: new TextStyle(color: Colors.white, fontSize: 15.0),
                    )),
              ],
            );
          })),
    );
  }

  Future _onClickGoogleAuth() async {
    GoogleSignInAccount user = googleSignIn.currentUser;
    if (user == null) {
      user = await googleSignIn.signInSilently();
    }
    if (user == null) {
      await googleSignIn.signIn();
      //TODO add analytics analytics.logLogin();
    }
    if (await auth.currentUser() == null) {
      //new
      GoogleSignInAuthentication credentials =
          await googleSignIn.currentUser.authentication;
      firebaseUser = await auth.signInWithGoogle(
        //new
        idToken: credentials.idToken, //new
        accessToken: credentials.accessToken, //new
      );
      //setting preferences
      _settingPreferenceData(firebaseUser);

      //new activity(widget)
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new HomePage()));
    }

    //setting preferences
    _settingPreferenceData(firebaseUser);

    //new activity(widget)
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new HomePage()));
  }

  Future _onClickFacebookAuth() async {
    firebaseUser = await auth.currentUser();

    final result = await facebookSignIn.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        firebaseUser = await auth.signInWithFacebook(
            accessToken: result.accessToken.token);

        //setting preferences
        _settingPreferenceData(firebaseUser);

        //new activity(widget)
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new HomePage()));
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

  void _showInDevelopToast() {
    Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("Sending Message"),
        ));
  }

  Future _settingPreferenceData(FirebaseUser user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DocumentReference databaseUser = users.document(user.uid);
    DocumentSnapshot userData = await databaseUser.get();
    bool _shopIsCreated = false;

    if (userData.data != null) {
      _shopIsCreated = userData["shop_is_created"];

      if(_shopIsCreated) {
        DocumentReference shopReference = userData["shop_reference"];
        prefs.setString("shopID", shopReference.documentID);
      }
    }

    //setting offline preferences
    prefs.setString("name", user.displayName);
    prefs.setString("photo_url", user.photoUrl);
    prefs.setString("email", user.email);
    prefs.setBool("shop_is_created", _shopIsCreated);

    databaseUser.setData(<String, dynamic>{
      'name': user.displayName,
      'photo_url': user.photoUrl,
      'email': user.email,
      'shop_is_created': false,
    });
  }
}
