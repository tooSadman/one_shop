import 'package:flutter/material.dart';

///
/// Create by Nikita Kiselov
///

class BoxWidget extends StatelessWidget {
  String _asset_image;

  BoxWidget(this._asset_image);

  @override
  Widget build(BuildContext context) {
    final Widget image = new GestureDetector(
        child: new Hero(
            tag: "tag",
            child: (_asset_image == null)
                ? new Container(
                    color: Colors.white,
                    child: new FlatButton(child: new Icon(Icons.add, color: Colors.black, size: 40.0), onPressed: () {}),
                  )
                : new Image.asset(
                    _asset_image,
                    fit: BoxFit.cover,
                  )));

    return new GridTile(
      footer: new GestureDetector(
        child: (_asset_image == null)
            ? new Container()
            : new GridTileBar(
                backgroundColor: Colors.black87,
                title: new Text("Box"),
              ),
      ),
      child: image,
    );
  }
}
