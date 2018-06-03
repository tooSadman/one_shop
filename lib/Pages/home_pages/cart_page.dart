import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_f/Pages/order_page.dart';
import 'package:project_f/UI/cart_item.dart';

///
///  Create by sin_maminoy_podrugi
///

class CartPage extends StatefulWidget {
  @override
  State createState() => new CartPageState();
}

class CartPageState extends State<CartPage> {
  String _cartPrice = "240.00 грн.";

  @override
  Widget build(BuildContext context) {
    Widget settingsSection = new Padding(
        padding: new EdgeInsets.only(top: 0.0),
        child: new Column(
          children: <Widget>[
            new CartItem("images/notebook.png", "Блокнот Гусь", "220 грн. ",
                () => print("pizda")),
            new CartItem("images/postcard.png", "Листівка Happy", "20 грн. ",
                () => print("pizda"))
          ],
        ));

    Widget cartSum = new Container(
      padding: new EdgeInsets.fromLTRB(30.0, 40.0, 15.0, 10.0),
      child: new Column(
        children: <Widget>[
          new Row(children: <Widget>[
            new Container(
              child: new Text("Разом:",
                  style:
                      new TextStyle(fontSize: 15.0, color: Colors.grey[500])),
            ),
            new Expanded(
                child: new Container(
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.only(right: 20.0),
              child: new Text(_cartPrice,
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    // fontWeight: FontWeight.bold
                  )),
            ))
          ]),
          new Padding(
              padding: new EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
              child: new Divider(
                height: 2.0,
                color: Colors.grey[500],
              ))
        ],
      ),
    );

    Widget confirmOrderButton = new Container(
        margin: new EdgeInsets.fromLTRB(30.0, 25.0, 30.0, 10.0),
        child: new MaterialButton(
            height: 50.0,
            color: Colors.black,
            onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new OrderPage())),
            child: new Text(
              "ОФОРМИТИ ЗАМОВЛЕННЯ",
              style: new TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )));

    return new Scaffold(
        body: new ListView(
            children: [settingsSection, cartSum, confirmOrderButton]));
  }
}
