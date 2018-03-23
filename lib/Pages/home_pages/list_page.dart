import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new ListPageState();
  }

}

class ListPageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return new Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(
                left: 8.0, top: 32.0, right: 8.0, bottom: 4.0),
            child: new Container(
                decoration: new BoxDecoration(
                    border: new Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: new BorderRadius.all(
                        new Radius.circular(10.0))
                ),
                child: new Row(
                  children: <Widget>[
                    new Container( //new
                        margin: new EdgeInsets.symmetric(horizontal: 4.0), //new
                        child: new IconButton( //new
                          icon: new Icon(Icons.search), onPressed: () {}, //new

                        )
                    ),
                    new Flexible(
                      child: new TextField(
                        controller: null,
                        onSubmitted: null,
                        decoration: new InputDecoration.collapsed(
                            hintText: "Пошук..."),
                      ),
                    ),


                  ],
                )
            ),
          ),

          new Container(
              child: new Flexible(
                  child: new StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) =>
                    new Container(
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                          border: new Border.all(
                            color: Colors.grey,
                            width: 1.0
                          ),
                          color: Colors.black45
                        ),
                        margin: new EdgeInsets.only(left: index.isEven ? 4.0 : 0.0,
                        right: index.isEven ? 0.0 : 4.0),
                        child: new Center(
                          child: new CircleAvatar(
                            backgroundColor: Colors.white,
                            child: new Text('1'),
                          ),
                        )
                    ),
                    staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, 3),
                    mainAxisSpacing: 6.0,
                    crossAxisSpacing: 6.0,
                  )
              )
          ),

        ]

    );
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

