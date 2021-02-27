import 'package:amplifyit/views/auth/sign_in.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('data'),
          SignIn(),
        ],
      ),
    );
  }
}