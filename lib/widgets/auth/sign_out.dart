import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplifyit/helpers/constants.dart';
import 'package:amplifyit/widgets/blog_button.dart';
import 'package:flutter/material.dart';

class SignOut extends StatefulWidget {
  @override
  _SignOutState createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  void _signOut() async {
    try {
      await Amplify.Auth.signOut().whenComplete(() =>
          Navigator.pushNamedAndRemoveUntil(
              context, RouteConstant.AUTH, (Route<dynamic> route) => false));
    } on AuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlogButton(
      onTap: _signOut,
      text: 'Sign Out',
    );
  }
}
