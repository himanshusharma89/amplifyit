import 'package:amplifyit/models/ModelProvider.dart';
import 'package:amplifyit/views/post/view_post.dart';
import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final Post post;
  CardView({this.post});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => PostView(post)));
          // Navigator.pushNamed(context, RouteConstant.VIEW_POST,
          //     arguments: postsList[index]);
        },
        child: Card(
            elevation: 4.0,
            color: Theme.of(context).primaryColor.withOpacity(0.6),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.border_color,
                        size: 18.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        post.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    post.body,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
