import 'package:flutter/material.dart';
import 'package:project_f/UI/order_item.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State createState() => new RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {

  List<String> _sex = <String>[
    'Чоловіча',
    'Жіноча'
  ];

  String _region = '';
  

  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      color: Colors.white,
      padding: new EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 10.0),
      child: new Text(
        "Остання точка перед стартом! Розкажи нам трохм про себе та твої вподобання, щоб ми могли підібрати для тебе найкраще!",
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
          new OrderItem("Повне ім'я", TextInputType.text),
         /* new Container(
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
            items: _sex.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
          )),
    ),*/
          new OrderItem("Email", TextInputType.emailAddress),
          new OrderItem("Номер телефону", TextInputType.phone),
        ],
      ),
    );

    Widget deliveryInfoTitle = new Container(
      color: Colors.white,
      padding: new EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
      child: new Text(
        "Створюючи акаунт ти погоджуєшся з нашими Загальними положеннями і умовами та Політикою конфіденційності",
        softWrap: true,
        style: new TextStyle(
            color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );




    Widget confirmOrderButton = new Container(
        margin: new EdgeInsets.fromLTRB(30.0, 25.0, 30.0, 40.0),
        child: new MaterialButton(
            height: 50.0,
            color: Colors.black,
            onPressed: () => {},
            child: new Text(
              "ЗАВЕРШИТИ РЕЄСТРАЦІЮ!",
              style: new TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )));

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("РЕЄСТРАЦІЯ",
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
          confirmOrderButton
        ]));
  }
}
