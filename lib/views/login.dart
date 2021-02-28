import 'package:amplifyit/widgets/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'AmplifyIt',
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SvgPicture.asset(
              'assets/login.svg',
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            SignIn(),
          ],
        ),
      ),
    );
  }
}
