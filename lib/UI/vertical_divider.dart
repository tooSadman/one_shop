import 'package:flutter/material.dart';

///
/// Create by Nikita Kiselov
///

class VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 25.0,
      width: 2.0,
      color: Colors.grey,
      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
    );
  }
}