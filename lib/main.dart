import 'dart:async';
import 'package:project_f/Pages/add_new_product_page.dart';
import 'package:project_f/Pages/adding_product_page.dart';
import 'package:project_f/Pages/creating_shop_intro/adding_images.dart';
import 'package:project_f/Pages/creating_shop_intro/instagram_integration.dart';
import 'package:project_f/Pages/creating_shop_intro/intro_creating.dart';
import 'package:project_f/Pages/creating_shop_intro/succesfully_added.dart';
import 'package:project_f/Pages/payment/succesfull_payment.dart';
import 'package:project_f/Pages/shop_page.dart';
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
      routes: <String, WidgetBuilder> {
        '/shop_page': (BuildContext context) => new ShopPage(null),
        '/intro_creating' : (BuildContext context) => new IntroCreatingShopPage(),
        '/instagram_integration' : (BuildContext context) => new InstagramIntegrationPage(),
        '/add_images' : (BuildContext context) => new AddingInfoPage(),
        '/successfully_added' : (BuildContext context) => new SuccessfullyAddedPage(),
        '/home_page' : (BuildContext context) => new HomePage(),
        '/adding_product' : (BuildContext context) => new AddingProductPage(),
        '/successfully' : (BuildContext context) => new SuccessfullyPaymentPage(),
      },
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




