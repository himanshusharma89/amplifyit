import 'package:amplifyit/helpers/constants.dart';
import 'package:amplifyit/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardView extends StatelessWidget {
  const CardView({this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RouteConstant.VIEW_POST,
              arguments: post);
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: const Offset(2, 2),
                      color: Colors.grey[300],
                      blurRadius: 6),
                  BoxShadow(
                      offset: const Offset(-1, -1),
                      color: Colors.grey[300],
                      blurRadius: 3)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/read_post.svg',
                    height: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post.title,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        post.body,
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
