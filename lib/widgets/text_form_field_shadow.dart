import 'package:flutter/material.dart';

class TextFormFieldShadow extends StatelessWidget {
  final Widget child;
  TextFormFieldShadow({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(offset: Offset(2, 2), color: Colors.grey[300], blurRadius: 6),
      ]),
      child: child,
    );
  }
}
