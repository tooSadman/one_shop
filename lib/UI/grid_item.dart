import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_f/Pages/product_page.dart';

class GridItem extends StatelessWidget {
  final String _photoUrl;
  final String _documentID;

  GridItem(this._photoUrl, this._documentID);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
            border: new Border.all(
                color: new Color.fromRGBO(149, 152, 154, 0.15), width: 2.0),
            image: new DecorationImage(
              image: new CachedNetworkImageProvider(_photoUrl),
              fit: BoxFit.cover,
            ),
            color: Colors.white),
      ),
      onTap: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new ProductPage(_documentID))),
    );
  }
}
