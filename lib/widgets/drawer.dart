import 'package:amplifyit/helpers/constants.dart';
import 'package:amplifyit/widgets/auth/sign_out.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            children: <Widget>[
              Ink(
                child: ListTile(
                  title: const Text('About',
                      style: TextStyle(
                        fontSize: 15.0,
                        // color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  trailing: const Icon(
                    Icons.info,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, RouteConstant.ABOUT);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/fun.svg'),
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
