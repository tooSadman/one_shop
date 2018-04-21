import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_f/Pages/creating_shop_intro/succesfully_added.dart';
import 'package:project_f/UI/titled_text_in_shop_creating.dart';

class AddingInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AddingInfoPageState();
  }
}

class AddingInfoPageState extends State<AddingInfoPage> {
  Image _coverImage;
  Image _logoImage;

  BoxDecoration _coverBoxDecoration = new BoxDecoration(
    color: new Color.fromRGBO(243, 243, 243, 1.0),
  );

  BoxDecoration _logoBoxDecoration = new BoxDecoration(
    color: new Color.fromRGBO(243, 243, 243, 1.0),
    border: new Border.all(color: Colors.white, width: 5.0),
    borderRadius: new BorderRadius.circular(80.0),
  );

  Uri _downloadUrl;
  File _imageFile;

  bool _isHaveCoverImage = false;
  bool _isHaveLogoImage = false;

//  CollectionReference get messages =>
//      Firestore.instance.collection('shops/dvjxfkTLXsZtRKhbxkYA/goods');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Text(
          "ЗОБРАЖЕННЯ",
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
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
              child: new Stack(
                alignment: AlignmentDirectional.topCenter,
                children: <Widget>[
                  new GestureDetector(
                    child: new Container(
                      child: _isHaveCoverImage
                          ? null
                          : new Text(
                              "Натискай, щоб редагувати",
                              style: new TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                      alignment: Alignment.center,
                      decoration: _coverBoxDecoration,
                      height: 240.0,
                    ),
                    onTap: () async {
                      _imageFile = await ImagePicker.pickImage(
                          source: ImageSource.gallery);
                      setState(() {
                        _coverImage = new Image.file(_imageFile, width: 200.0);
                        _coverBoxDecoration = new BoxDecoration(
                            color: new Color.fromRGBO(243, 243, 243, 1.0),
                            image: new DecorationImage(
                                image: _coverImage.image, fit: BoxFit.cover));
                        _isHaveCoverImage = true;
                      });
                    },
                  ),
                  new GestureDetector(
                    child: new Container(
                      decoration: _logoBoxDecoration,
                      child: _isHaveLogoImage
                          ? null
                          : new Icon(
                              Icons.photo_camera,
                              size: 80.0,
                              color: Colors.grey,
                            ),
                      width: 160.0,
                      height: 160.0,
                      margin: new EdgeInsets.only(top: 160.0),
                    ),
                    onTap: () async {
                      _imageFile = await ImagePicker.pickImage(
                          source: ImageSource.gallery);
                      setState(() {
                        _logoImage = new Image.file(_imageFile);
                        _logoBoxDecoration = new BoxDecoration(
                            color: new Color.fromRGBO(243, 243, 243, 1.0),
                            border:
                                new Border.all(color: Colors.white, width: 5.0),
                            borderRadius: new BorderRadius.circular(80.0),
                            image: new DecorationImage(
                                image: _logoImage.image, fit: BoxFit.cover));
                        _isHaveLogoImage = true;
                      });
                    },
                  )
                ],
              ),
            ),
            new TitledTextInShopCreating(
                "Sammy Icon",
                "Незалежний бренд "
                "аксесуарів для тих, хто сприймає життя як справжню пригоду!"),
            new Padding(
              padding: new EdgeInsets.all(16.0),
              child: new CupertinoButton(
                child: new Text(
                  "ПРОДОВЖИТИ",
                  style: new TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: new EdgeInsets.fromLTRB(100.0, 16.0, 100.0, 16.0),
                onPressed: () async {
//                  //creating random number
//                  int random = new Random().nextInt(1000000);
//
//                  StorageReference ref =
//                  FirebaseStorage.instance.ref().child("image_$random.jpg");
//
//                  StorageUploadTask uploadTask = ref.put(_imageFile);
//                  _downloadUrl = (await uploadTask.future).downloadUrl;
//
//                  final DocumentReference document = messages.document(random.toString());
//                  document.setData(<String, dynamic>{
//                    'message': 'Hello world!',
//                    'photo_url': _downloadUrl.toString()
//                  });

                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new SuccessfullyAddedPage()));
                },
                color: Colors.black,
                pressedOpacity: 0.5,
                borderRadius: new BorderRadius.circular(4.0),
              ),
            )
          ]),
    );
  }
}
