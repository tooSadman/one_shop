import 'package:flutter/material.dart';

class ShopCategoryItem extends StatelessWidget {
  String _category_image;
  String _title;

  ShopCategoryItem(this._category_image, this._title);

  //final TextEditingController _controller = new TextEditingController( text: _field_title);

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      padding: new EdgeInsets.fromLTRB(6.0, 15.0, 6.0, 5.0),
      child: new Column(children: <Widget>[
        new Container(
          height: 70.0,
          width: 70.0,
          decoration: new BoxDecoration(
            //color: Colors.red,
            image: new DecorationImage(
              image: new AssetImage(_category_image),
              fit: BoxFit.fill,
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(60.0)),
            border: new Border.all(
              color: Colors.black45,
              width: 1.0,
            ),
          ),
        ),
        new Container(
          padding: new EdgeInsets.only(top: 4.0),
            child: new Text(
          _title,
          style: new TextStyle(color: Colors.black45),
          textAlign: TextAlign.center,
        ))
      ]),
    );
  }
}
