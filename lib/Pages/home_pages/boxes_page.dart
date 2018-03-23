import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project_f/UI/box_widget.dart';

class BoxesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BoxesPageState();
  }

}

class BoxesPageState extends State<BoxesPage> {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('images/box.png'),
              fit: BoxFit.cover,
            )
        ),

        child: new Column(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(top: 50.0, bottom: 10.0),
              child: new Text(
                "Мої коробки", textAlign: TextAlign.center,
                style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(
                  left: 16.0, right: 16.0, bottom: 45.0),
              child: new Column(
                children: <Widget>[
                  new Text(
                    "Зберігай у коробках товари, що тебе зацікавили найбільше, щоб повернутись до них пізніше",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            new Expanded(
              child: new SafeArea(
                top: false,
                bottom: false,
                child: new GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  padding: const EdgeInsets.all(12.0),
                  children: <Widget>[
                    new BoxWidget('images/box_image_1.png'),
                    new BoxWidget('images/box_image_2.png'),
                    new BoxWidget('images/box_image_3.png'),
                    new BoxWidget('images/login.png'),
                  ],
                ),
              ),
            ),
          ],
          
        ),


      ),
    );
  }

}