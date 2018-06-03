import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project_f/UI/box_widget.dart';
import 'package:project_f/UI/titled_text_in_shop_creating.dart';

///
/// Create by Nikita Kiselov
///

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Padding(
        padding: new EdgeInsets.all(0.0),
        child: new Column(
          children: <Widget>[
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
            new Row(
              children: <Widget>[
                new Container(
                  //new
                    margin: new EdgeInsets.symmetric(horizontal: 4.0), //new
                    child: new IconButton(
                      //new
                      icon: new Icon(Icons.timelapse), onPressed: () {}, //new
                    )),
                new Flexible(
                  child: new Text("Нові",
                  style: new TextStyle(
                    color: Colors.black
                  ),
                  )
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Container(
                  //new
                    margin: new EdgeInsets.symmetric(horizontal: 4.0), //new
                    child: new IconButton(
                      //new
                      icon: new Icon(Icons.star), onPressed: () {}, //new
                    )),
                new Flexible(
                  child: new Text("Популярні",
                    style: new TextStyle(
                        color: Colors.black
                    ),
                  )
                ),
              ],
            ),
            new Container(
              child: new Padding(padding: new EdgeInsets.only(top: 200.0),
              child: new Text("Вибачте, ця сторінка ще на стадії розробки :(",
                style: new TextStyle(
                  color: Colors.grey
                ),),
              ),
            )
          ],
        ),

      ),
    );
  }
}
