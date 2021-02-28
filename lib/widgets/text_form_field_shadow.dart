import 'package:flutter/material.dart';

class TextFormFieldShadow extends StatelessWidget {
  const TextFormFieldShadow({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            offset: const Offset(2, 2), color: Colors.grey[300], blurRadius: 6),
      ]),
      child: child,
    );
  }
}
