import 'package:flutter/material.dart';
import '../UI/order_item.dart';

class AddProductPage extends StatefulWidget {
  @override
  State createState() => new AddProductPageState();
}

class AddProductPageState extends State<AddProductPage> {
  List<String> _allCategories = <String>[
    'Cosmetics',
    'Clothes',
    'Other'
  ];

  List<String> _addedPhotos = <String>[
    'images/wr.jpg',
    'images/wr.jpg',
    'images/wr.jpg',
    'images/wr.jpg',
    'images/wr.jpg',
    'images/wr.jpg'
  ];

  String _product = 'Cosmetics';
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    Widget productInfo = new Container(
      color: Colors.white,
      padding: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 7.0),
      child: new Column(
        children: <Widget>[
          new OrderItem("Назва товару", TextInputType.text),
          new Container(
            color: Colors.white,
            padding: new EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
            child: new InputDecorator(
                decoration: const InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Область',
                  hintText: 'Виберіть вашу область',
                ),
                //isEmpty: _region == null,
                child: new DropdownButton<String>(
                  iconSize: 0.0,
                  style: new TextStyle(fontSize: 17.0, color: Colors.black),
                  value: _product,
                  isDense: true,
                  onChanged: (String newValue) {
                    setState(() {
                      _product = newValue;
                    });
                  },
                  items: _allCategories.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                )),
          ),
          new OrderItem("Короткий опис", TextInputType.text),
          new OrderItem("Ціна в гривнях", TextInputType.number),
          new OrderItem("#Теги", TextInputType.text),
          new OrderItem("Розміри (не обов'язково)", TextInputType.text),
          new OrderItem("Кольори (не обов'язково)", TextInputType.text),
        ],
      ),
    );

    Widget addPhotoTitle = new Container(
      color: Colors.white,
      padding: new EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
      child: new Text(
        "Додати фото",
        softWrap: true,
        style: new TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );

    Widget addPhotoButtons = new Container(
        color: Colors.white,
        padding: new EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 15.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
                child: new Container(
                    margin: new EdgeInsets.only(right: 10.0),
                    child: new MaterialButton(
                        height: 50.0,
                        color: Colors.black,
                        onPressed: () => {},
                        child: new Text(
                          "З ТЕЛЕФОНУ",
                          style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )))),
            new Expanded(
                child: new Container(
                    margin: new EdgeInsets.only(left: 10.0),
                    foregroundDecoration: new BoxDecoration(
                        border: new Border.all(width: 1.0, color: Colors.black),
                        borderRadius: new BorderRadius.circular(5.0)),
                    child: new MaterialButton(
                        height: 50.0,
                        color: Colors.white,
                        onPressed: () => {},
                        child: new Text(
                          "З  INSTAGRAM",
                          style: new TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ))))
          ],
        ));

    Widget addedPhotosExpansionPanel = new Container(
        padding: new EdgeInsets.symmetric(horizontal: 20.0),
        child: new ExpansionTile(
          initiallyExpanded: true,
          title: new Text(
            "Додані фото",
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          children: <Widget>[
            new GridView.count(
                shrinkWrap: true,
                crossAxisCount: (orientation == Orientation.portrait) ? 3 : 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                padding: const EdgeInsets.all(4.0),
                childAspectRatio:
                    (orientation == Orientation.portrait) ? 1.0 : 1.3,
                children: _addedPhotos.map((String url) {
                  return new GridTile(
                      child: new Image.asset(url, fit: BoxFit.cover));
                }).toList()),
          ],
        ));

    Widget confirmAddProductButton = new Container(
        padding: new EdgeInsets.fromLTRB(30.0, 25.0, 30.0, 8.0),
        child: new MaterialButton(
            height: 50.0,
            color: Colors.black,
            onPressed: () => {},
            child: new Text(
              "ОПУБЛІКУВАТИ ТОВАР",
              style: new TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )));

    Widget previewButton = new Container(
        margin: new EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 40.0),
        foregroundDecoration: new BoxDecoration(
            border: new Border.all(width: 1.0, color: Colors.black),
            borderRadius: new BorderRadius.circular(5.0)),
        child: new MaterialButton(
            height: 50.0,
            color: Colors.white,
            onPressed: () => {},
            child: new Text(
              "ПОПЕРЕДНІЙ ПЕРЕГЛЯД",
              style: new TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )));

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("ДОДАТИ ТОВАР",
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
          productInfo,
          addPhotoTitle,
          addPhotoButtons,
          addedPhotosExpansionPanel,
          confirmAddProductButton,
          previewButton
        ]));
  }
}
