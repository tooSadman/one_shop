import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  String _field_title;

  OrderItem(this._field_title);

  //final TextEditingController _controller = new TextEditingController( text: _field_title);

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: new EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
        child: new TextField(
          // controller: _controller,
          decoration: new InputDecoration(
            labelText: _field_title,
            border: const OutlineInputBorder(),
          ),
          style: Theme.of(context).textTheme.display1.copyWith(fontSize: 17.0),
        ));
  }
}
