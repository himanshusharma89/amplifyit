import 'package:amplifyit/helpers/constants.dart';
import 'package:amplifyit/models/Post.dart';
import 'package:amplifyit/services/post_service.dart';
import 'package:amplifyit/widgets/blog_button.dart';
import 'package:amplifyit/widgets/text_form_field_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditPost extends StatefulWidget {
  const EditPost(this.post);
  final Post post;

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Post',
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
      body: ListView(
        children: <Widget>[
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
              child: Column(
                children: <Widget>[
                  TextFormFieldShadow(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Post Title',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.only(right: 15, left: 15),
                          enabledBorder: InputBorder.none),
                      onChanged: (String value) => titleController.text = value,
                      onSaved: (String val) => titleController.text = val,
                      validator: (String val) {
                        if (val.isEmpty) {
                          return "Title filed can't be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormFieldShadow(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Post Body',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.only(
                              right: 15, top: 15, bottom: 15, left: 15),
                          enabledBorder: InputBorder.none),
                      maxLines: 7,
                      onChanged: (String value) => bodyController.text = value,
                      onSaved: (String val) => bodyController.text = val,
                      validator: (String val) {
                        if (val.isEmpty) {
                          return "Body field can't be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          SvgPicture.asset('assets/edit_post.svg', height: 200),
        ],
      ),
      floatingActionButton: BlogButton(
        text: 'Update The Post',
        onTap: () {
          PostService().updatePost(widget.post,
              title: titleController.text.isEmpty
                  ? widget.post.title
                  : titleController.text,
              body: bodyController.text.isEmpty
                  ? widget.post.body
                  : bodyController.text);
          Navigator.pushNamed(context, RouteConstant.ROOT);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
