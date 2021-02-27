import 'package:amplifyit/helpers/constants.dart';
import 'package:amplifyit/widgets/auth/sign_out.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogDrawer extends StatefulWidget {
  @override
  _BlogDrawerState createState() => _BlogDrawerState();
}

class _BlogDrawerState extends State<BlogDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              children: [
                Ink(
                  child: ListTile(
                    title: Text("About",
                        style: TextStyle(
                          fontSize: 15.0,
                          // color: Colors.black,
                          fontWeight: FontWeight.w600,
                        )),
                    trailing: Icon(
                      Icons.info,
                      color: Colors.blueAccent,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, RouteConstant.ABOUT);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SignOut(),
                ),
              ],
            ),
          ),
        ),
      );
  }
}