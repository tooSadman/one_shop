import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_f/Pages/home_page.dart';
import 'package:project_f/Pages/login_page.dart';

final auth = FirebaseAuth.instance;
final googleSignIn = new GoogleSignIn();
final FacebookLogin facebookSignIn = new FacebookLogin();
FirebaseUser firebaseUser;

Future main() async {
  firebaseUser = await auth.currentUser();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
      ),
      home: _chooseStartingPage(),
    );
  }
}

Widget _chooseStartingPage() {
  if (firebaseUser != null) {
    return new HomePage();
  } else {
    return new LoginPage();
  }
}




