import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _signUpError;
  void _signIn() async {
    // Sign out before in case a user is already signed in
    // If a user is already signed in - Amplify.Auth.signIn will throw an exception
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e);
    }

    try {
      SignInResult res =
          await Amplify.Auth.signInWithWebUI(provider: AuthProvider.google);
      print(res);
    } on AuthException catch (e) {
      setState(() {
        _signUpError = e.message;
      });
    }

    try {
      var res = await Amplify.Auth.fetchUserAttributes();
      print(res[0].userAttributeKey);
      print("fetchUserAttributes: $res");
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: _signIn,
        child: const Text('Sign In'),
      ),
    );
  }
}
