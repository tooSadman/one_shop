import 'package:flutter/material.dart';
import 'package:project_f/UI/settings_item.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:math';
import 'dart:io';

class AddingProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AddingProductPageState();
  }
}

class AddingProductPageState extends State<AddingProductPage> {
  Image _product_image = new Image.asset("images/gus.png", width: 300.0);
  Uri _downloadUrl = null;
  File _imageFile = null;
  CollectionReference get messages => Firestore.instance.collection('shops/dvjxfkTLXsZtRKhbxkYA/goods');

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
              child: _product_image),
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
                    _product_image =
                        new Image.file(_imageFile, width: 200.0);
                  });
                },
              ),
              new SettingsItem(
                Icons.image,
                "Готово",
                "зберегти зміни",
                () async {
                  int random = new Random().nextInt(100000);
                  StorageReference ref =
                      FirebaseStorage.instance.ref().child("image_$random.jpg");
                  StorageUploadTask uploadTask = ref.put(_imageFile);
                  _downloadUrl = (await uploadTask.future).downloadUrl;

                  final DocumentReference document = messages.document(random.toString());
                  document.setData(<String, dynamic>{
                    'message': 'Hello world!',
                    'photo_url': _downloadUrl.toString()
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
