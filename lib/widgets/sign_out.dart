import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplifyit/helpers/constants.dart';
import 'package:flutter/material.dart';

class SignOut extends StatefulWidget {
  @override
  _SignOutState createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  void _signOut() async {
    try {
      await Amplify.Auth.signOut()
          .whenComplete(() => Navigator.pushNamed(context, RouteConstant.AUTH));
    } on AuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _signOut,
      child: const Text('Sign Out'),
    );
  }
}
