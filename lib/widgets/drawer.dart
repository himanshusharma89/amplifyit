import 'package:amplifyit/helpers/constants.dart';
import 'package:amplifyit/widgets/sign_out.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BlogDrawer extends StatefulWidget {
  @override
  _BlogDrawerState createState() => _BlogDrawerState();
}

class _BlogDrawerState extends State<BlogDrawer> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Drawer(
        child: SafeArea(
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
      );
  }
}