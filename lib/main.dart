import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_f/Pages/HomePage.dart';
import 'package:project_f/Pages/LoginPage.dart';

final auth = FirebaseAuth.instance;
final googleSignIn = new GoogleSignIn();

void main() => runApp(
    new MyApp()
);

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
      home: new LoginPage(),

    );
  }
}
