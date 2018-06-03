import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_f/Pages/creating_shop_intro/succesfully_added.dart';
import 'package:project_f/UI/titled_text_in_shop_creating.dart';
import 'package:project_f/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Uri _downloadCoverUrl;
  Uri _downloadLogoUrl;

  File _imageLogoFile;
  File _imageCoverFile;

  bool _isHaveCoverImage = false;
  bool _isHaveLogoImage = false;

  bool _isLoading = false;

  CollectionReference get shops => Firestore.instance.collection('shops');

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return new Material(
        child: new Center(
          child: new CircularProgressIndicator(strokeWidth: 15.0,),
        ),
      );
    } else {
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
                        _imageCoverFile = await ImagePicker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          _coverImage = new Image.file(_imageCoverFile);
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
                        _imageLogoFile = await ImagePicker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          _logoImage = new Image.file(_imageLogoFile);
                          _logoBoxDecoration = new BoxDecoration(
                              color: new Color.fromRGBO(243, 243, 243, 1.0),
                              border: new Border.all(
                                  color: Colors.white, width: 5.0),
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
                    //setting loading screen
                    setState(() {
                      _isLoading = true;
                    });
                    //creating random number
                    int random = new Random().nextInt(1000000);

                    StorageReference ref = FirebaseStorage.instance.ref();

                    StorageUploadTask uploadTask = ref
                        .child("image_cover_$random.jpg")
                        .put(_imageCoverFile);
                    _downloadCoverUrl = (await uploadTask.future).downloadUrl;

                    uploadTask =
                        ref.child("image_logo_$random.jpg").put(_imageLogoFile);
                    _downloadLogoUrl = (await uploadTask.future).downloadUrl;

                    final DocumentReference document =
                        await shops.add(<String, dynamic>{
                      'logo_url': _downloadLogoUrl.toString(),
                      'cover_url': _downloadCoverUrl.toString(),
                      'name': "ONE:SHOP",
                      'about': "Bla, bla, bla....",
                    });

                    //getting user id in database
                    firebaseUser = await auth.currentUser();
                    var _currentUserID = firebaseUser.uid;

                    Firestore.instance
                        .collection('users')
                        .document(_currentUserID)
                        .updateData(<String, dynamic>{
                      'shop_reference': document,
                    });

                    //Pushing data to internal memory
                    _settingPreferenceData(document.documentID);

                    //Pop other screens
                    while (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }

                    Navigator.of(context).pushNamed('/successfully_added');
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

  Future _settingPreferenceData(String shopID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("shopID", shopID);
  }
}
