import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  String _asset_image;


  BoxWidget(this._asset_image);

  @override
  Widget build(BuildContext context) {
    final Widget image = new GestureDetector(
        child: new Hero(
            tag: "teg",
            child: new Image.asset(
              _asset_image,
              fit: BoxFit.cover,
            )
        )
    );


    return new GridTile(
      footer: new GestureDetector(
        child: new GridTileBar(
          backgroundColor: Colors.black87,
          title: new Text("Box"),
        ),
      ),
      child: image,
    );
  }
}