import 'package:amplifyit/helpers/constants.dart';
import 'package:amplifyit/models/ModelProvider.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final Post post;
  CardView({this.post});
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
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 2),
                      color: Colors.grey[300],
                      blurRadius: 6),
                  BoxShadow(
                      offset: Offset(-1, -1),
                      color: Colors.grey[300],
                      blurRadius: 3)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    post.body,
                    style: TextStyle(),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
