import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_f/UI/order_item.dart';
import 'package:project_f/UI/settings_item.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:math';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';


class AddingProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AddingProductPageState();
  }
}

class AddingProductPageState extends State<AddingProductPage> {
  Image _productImage = new Image.asset("images/gus.png", height: 300.0);
  Uri _downloadUrl;
  File _imageFile;
  TextEditingController _about = new TextEditingController();
  TextEditingController _price = new TextEditingController();
  TextEditingController _name = new TextEditingController();

  List<String> _allCategories = <String>[
    'Cosmetics',
    'Clothes',
    'Hand-made-thing',
    "Toy(s)",
    'Other'
  ];
  String _product = 'Cosmetics';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Text(
          "ДОДАТИ ТОВАР",
          style: new TextStyle(color: Colors.black, fontSize: 15.0),
        ),
        elevation: 0.0,
        centerTitle: true,
        leading: new IconButton(
          color: Colors.black,
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new OrderItem("Назва товару", TextInputType.text, textController: _name),
              new Container(
                color: Colors.white,
                padding: new EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                child: new InputDecorator(
                    decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Категорія',
                      hintText: 'Виберіть вашу категорію',
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
              new OrderItem("Короткий опис", TextInputType.text, textController: _about,),
              new OrderItem("Ціна в гривнях", TextInputType.number, textController: _price,),
              new OrderItem("#Теги", TextInputType.text),
              new OrderItem("Розміри (не обов'язково)", TextInputType.text),
              new OrderItem("Кольори (не обов'язково)", TextInputType.text),
              new Container(
                  padding: new EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
                  child: _productImage),
              new SettingsItem(
                Icons.add,
                "Додати фото",
                "",
                () async {
                  _imageFile =
                      await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 850.0);
                  setState(() {
                    _productImage =
                        new Image.file(_imageFile, width: 200.0);
                  });
                },
              ),
              new SettingsItem(
                Icons.done,
                "Готово",
                "зберегти зміни",
                () async {
                  String shopID;
                  int random = new Random().nextInt(100000);

                  StorageReference ref =
                      FirebaseStorage.instance.ref().child("image_$random.jpg");
                  StorageUploadTask uploadTask = ref.put(_imageFile);
                  _downloadUrl = (await uploadTask.future).downloadUrl;

                  //Setting preferences
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  shopID = prefs.get("shopID");

                  CollectionReference goodsReference = Firestore.instance.collection('goods');


                  final DocumentReference document = await goodsReference.add(<String, dynamic>{
                    'product_name' : _name.text,
                    'product_price' : _price.text,
                    'product_about': _about.text,
                    'image_list_height': 2,
                    'image_list_width': 2,
                    'photo_url': _downloadUrl.toString(),
                    'shop': Firestore.instance.document("/shops/" + shopID)
                  });

                  Navigator.of(context).pop();

                },
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _price.dispose();
    _name.dispose();
    _about.dispose();
    super.dispose();
  }


}


