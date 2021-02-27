import 'package:amplifyit/widgets/sign_in.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('data'),
            SizedBox(height: 20,),
            SignIn(),
          ],
        ),
      ),
    );
  }
}