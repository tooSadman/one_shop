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
    return new Padding(
        padding: new EdgeInsets.all(4.0),
        child: new StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) =>
          new Container(
              color: Colors.green,
              child: new Center(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Text('Text'),
                ),
              )
          ),
          staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, 3),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        )
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

