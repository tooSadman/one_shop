import 'dart:collection';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_f/Pages/home_page.dart';
import 'package:project_f/Pages/product_page.dart';
import 'package:project_f/UI/grid_item.dart';
import 'package:project_f/main.dart';

///
/// Create by Nikita Kiselov
///

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ListPageState();
  }
}

class ListPageState extends State<StatefulWidget> {
  HashMap<int, String> map = new HashMap<int, String>();
  int index = 1;

  @override
  Widget build(BuildContext context) {
    map.putIfAbsent(1, () => "images/girl.png");
    map.putIfAbsent(2, () => "images/gus.png");
    map.putIfAbsent(3, () => "images/socks.png");
    map.putIfAbsent(4, () => "images/sence.png");
    map.putIfAbsent(5, () => "images/box_image_1.png");
    map.putIfAbsent(6, () => "images/girl.png");
    map.putIfAbsent(7, () => "images/box_image_2.png");

    return new Column(children: <Widget>[
      new Padding(
        padding:
            new EdgeInsets.only(left: 8.0, top: 32.0, right: 8.0, bottom: 4.0),
        child: new Container(
            decoration: new BoxDecoration(
                border: new Border.all(
                  color: Colors.black,
                ),
                borderRadius: new BorderRadius.all(new Radius.circular(10.0))),
            child: new Row(
              children: <Widget>[
                new Container(
                    //new
                    margin: new EdgeInsets.symmetric(horizontal: 4.0), //new
                    child: new IconButton(
                      //new
                      icon: new Icon(Icons.search), onPressed: () {}, //new
                    )),
                new Flexible(
                  child: new TextField(
                    controller: null,
                    onSubmitted: null,
                    decoration:
                        new InputDecoration.collapsed(hintText: "Пошук..."),
                  ),
                ),
              ],
            )),
      ),
      new Container(
          child: new Flexible(
              child: new StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection('goods').snapshots,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return new Text('Loading...');
                    return new StaggeredGridView.count(
                      crossAxisCount: 4,
                      padding: new EdgeInsets.all(8.0),
                      staggeredTiles: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                        return new StaggeredTile.count(document["image_list_width"], document["image_list_height"]);
                      }).toList(),

//        staggeredTileBuilder: (int index) =>
//            new StaggeredTile.count(2, index > 4 ? index - 3 : index + 1),
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                        return new GridItem(document["photo_url"], document.documentID);
                      }).toList(),
                    );
                  }))
      ),
    ]);
  }
}

//TODO implement firebase list
//class ListPageState extends State<StatefulWidget> {
//  @override
//  Widget build(BuildContext context) {
//    return new StreamBuilder<QuerySnapshot>(
//      stream: Firestore.instance.collection('books').snapshots,
//      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//        if (!snapshot.hasData) return const Text('Loading...');
//        return new ListView(
//          children: snapshot.data.documents.map((DocumentSnapshot document) {
//            return new ListTile(
//              title: new Text(document['message']),
//            );
//          }).toList(),
//        );
//      },
//    );
//  }
//}
