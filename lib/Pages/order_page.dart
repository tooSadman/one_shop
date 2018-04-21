import 'package:flutter/material.dart';
import 'package:project_f/UI/order_item.dart';

class OrderPage extends StatefulWidget {
  @override
  State createState() => new OrderPageState();
}

class OrderPageState extends State<OrderPage> {
  List<String> _allRegions = <String>[
    'Вінницька',
    'Волинська',
    'Дніпропетровська',
    'Донецька',
    'Житомирська',
    'Закарпатська',
    'Запорізька',
    'Івано-Франківська',
    'Київська',
    'Кіровоградська',
    'Луганська',
    'Львівська',
    'Миколаївська',
    'Одеська',
    'Полтавська',
    'Рівненська',
    'Сумська',
    'Тернопільська',
    'Харківська',
    'Херсонська',
    'Хмельницька',
    'Черкаська',
    'Чернівецька',
    'Чернігівська',
    'м. Київ',
  ];

  String _region = 'Київська';

  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      color: Colors.white,
      padding: new EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 10.0),
      child: new Text(
        "Вводь лише правдиві дані, щоб магазин міг відправити тобі замовлення",
        softWrap: true,
        style: new TextStyle(color: Colors.black, fontSize: 16.0),
        textAlign: TextAlign.center,
      ),
    );

    Widget customerInfo = new Container(
      color: Colors.white,
      padding: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 7.0),
      child: new Column(
        children: <Widget>[
          new OrderItem("ПІБ одержувача"),
          new OrderItem("Email"),
          new OrderItem("Номер телефону"),
        ],
      ),
    );

    Widget deliveryInfoTitle = new Container(
      color: Colors.white,
      padding: new EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
      child: new Text(
        "ІНФОРМАЦІЯ ПРО ДОСТАВКУ",
        softWrap: true,
        style: new TextStyle(
            color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );

    Widget deliveryInfoRegion = new Container(
      color: Colors.white,
      padding: new EdgeInsets.fromLTRB(41.0, 20.0, 41.0, 7.0),
      child: new InputDecorator(
          decoration: const InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Область',
            hintText: 'Виберіть вашу область',
          ),
          isEmpty: _region == null,
          child: new DropdownButton<String>(
            iconSize: 0.0,
            style: new TextStyle(fontSize: 17.0, color: Colors.black),
            value: _region,
            isDense: true,
            onChanged: (String newValue) {
              setState(() {
                _region = newValue;
              });
            },
            items: _allRegions.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
          )),
    );


    Widget deliveyTextInfo = new Container(
      color: Colors.white,
      padding: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 15.0),
      child: new Column(
        children: <Widget>[
          new OrderItem("Населений пункт"),
          new OrderItem("Адреса доставки"),
          new OrderItem("Особливі побажання"),
        ],
      ),
    );

    Widget confirmOrderButton = new Container(
        margin: new EdgeInsets.fromLTRB(30.0, 25.0, 30.0, 40.0),
        child: new MaterialButton(
            height: 50.0,
            color: Colors.black,
            onPressed: () => {},
            child: new Text(
              "ПРОДОВЖИТИ",
              style: new TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )));

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Оформлення замовлення",
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: new IconButton(
            color: Colors.black,
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: new ListView(children: [
          titleSection,
          customerInfo,
          deliveryInfoTitle,
          deliveryInfoRegion,
          deliveyTextInfo,
          confirmOrderButton
        ]));
  }
}
