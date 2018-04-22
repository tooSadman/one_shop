import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  String _field_title;
  TextInputType _text_input_type;

  OrderItem(this._field_title, this._text_input_type);

  //final TextEditingController _controller = new TextEditingController( text: _field_title);

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: new EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
        child: new TextField(
          // controller: _controller,
          decoration: InputDecoration(
            labelText: _field_title,
            border: const OutlineInputBorder(),
          ),
          style: Theme.of(context).textTheme.display1.copyWith(fontSize: 15.0),
          keyboardType: _text_input_type,
        ));
  }
}
