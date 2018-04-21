import 'dart:async';

import 'package:flutter/material.dart';
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
  Image _productImage = new Image.asset("images/gus.png", width: 300.0);
  Uri _downloadUrl;
  File _imageFile;


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
          new Container(
              padding: new EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
              child: _productImage),
          new Column(
            children: <Widget>[
              new SettingsItem(
                Icons.image,
                "Додати товар",
                "",
                () async {
                  _imageFile =
                      await ImagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _productImage =
                        new Image.file(_imageFile, width: 200.0);
                  });
                },
              ),
              new SettingsItem(
                Icons.image,
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
                    'product_name' : 'Hello world!',
                    'product_about': 'Коли Семмі був маленьким, він думав, що бенгальский тигр – це тигр, '
                        'який запалює бенгальскі вогники. Вже будучи дорослим і зустрівши цього велетня у Гімалаях, він зрозумів свою помилку: не було ні гірлянд, ні вогників… була тільки необхідність бігти чимдуж.'
                        ' Але Семмі таки встиг замалювати тигра, щоб назавжди запам’ятати той момент прозріння.',
                    'photo_url': _downloadUrl.toString(),
                    'shop': '/shops/' + shopID
                  });

                },
              ),
            ],
          )
        ],
      ),
    );
  }


}


