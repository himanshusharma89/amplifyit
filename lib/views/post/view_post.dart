import 'package:amplifyit/helpers/constants.dart';
import 'package:amplifyit/models/Post.dart';
import 'package:amplifyit/services/post_service.dart';
import 'package:amplifyit/widgets/blog_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class PostView extends StatefulWidget {
  const PostView(this.post);
  final Post post;

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print(widget.post.date);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.post.title,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // backgroundColor: Color(0xffc8d9ff),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.post.body,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                )),
              ),
            ),
            const Divider(),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 4, 4, 4),
                    child: Text(
                      'Published: ${DateFormat.yMMMEd().format(DateTime.fromMillisecondsSinceEpoch(widget.post.date))}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        // color: Color(0xff133337),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    PostService().deletePost(widget.post.id);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            SvgPicture.asset('assets/view_post.svg', height: 200),
          ],
        ),
      ),
      floatingActionButton: BlogButton(
        text: 'Edit The Post',
        onTap: () {
          Navigator.pushNamed(context, RouteConstant.EDIT_POST,
              arguments: widget.post);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
