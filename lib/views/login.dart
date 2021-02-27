import 'package:amplifyit/widgets/sign_in.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('data'),
          SignIn(),
        ],
      ),
    );
  }
}