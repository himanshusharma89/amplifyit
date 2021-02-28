import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplifyit/dashboard.dart';
import 'package:amplifyit/widgets/blog_button.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool loader = false;
  Future<void> _signIn() async {
    // Sign out before in case a user is already signed in
    // If a user is already signed in - Amplify.Auth.signIn will throw an exception
    // try {
    //   await Amplify.Auth.signOut();
    // } on AuthException catch (e) {
    //   print(e);
    // }

    try {
      await Amplify.Auth.signInWithWebUI(provider: AuthProvider.google)
          .whenComplete(() => setState(() {
                loader = true;
              }));
    } on AuthException {
      setState(() {});
    }
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<dynamic>(builder: (_) => Dashboard()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return loader
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : BlogButton(
            onTap: _signIn,
            text: 'Sign In',
          );
  }
}
