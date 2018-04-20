import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddingInfoPage extends StatelessWidget {
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
              padding: new EdgeInsets.all(0.0),
              child: new Stack(
                alignment: AlignmentDirectional.topCenter,
                children: <Widget>[
                  new Container(
                    child: new Text(
                      "Натискай, щоб редагувати",
                      style: new TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.center,
                    decoration: new BoxDecoration(color: new Color.fromRGBO(243, 243, 243, 1.0)),
                    height: 240.0,
                  ),
                  new Container(
                    decoration: new BoxDecoration(
                        color: new Color.fromRGBO(243, 243, 243, 1.0),
                        border: new Border.all(color: Colors.white, width: 5.0),
                        borderRadius: new BorderRadius.circular(80.0),
                    ),
                    child: new Icon(Icons.photo_camera,
                    size: 80.0,
                      color: Colors.grey,
                    ),
                    width: 160.0,
                    height: 160.0,
                    margin: new EdgeInsets.only(top: 160.0),
                  )
                ],
              ),
            )
          ]),
    );
  }
}
