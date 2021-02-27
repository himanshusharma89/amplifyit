import 'package:amplifyit/models/Post.dart';
import 'package:amplifyit/services/post_service.dart';
import 'package:amplifyit/widgets/text_form_field_shadow.dart';
import 'package:flutter/material.dart';

class EditPost extends StatefulWidget {
  final Post post;

  EditPost(this.post);

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
        title: Text(
          "Edit Post",
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              TextFormFieldShadow(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Post Title",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(right: 15, left: 15),
                      enabledBorder: InputBorder.none),
                  onChanged: (value) => titleController.text = value,
                  onSaved: (val) => titleController.text = val,
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Title filed can't be empty";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormFieldShadow(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Post Body",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                          right: 15, top: 15, bottom: 15, left: 15),
                      enabledBorder: InputBorder.none),
                  maxLines: 7,
                  onChanged: (value) => bodyController.text = value,
                  onSaved: (val) => bodyController.text = val,
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Body field can't be empty";
                    }
                    return null;
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          child: Text("Save Changes"),
          onPressed: () {
            PostService().updatePost(widget.post,
                title: titleController.text.isEmpty
                    ? widget.post.title
                    : titleController.text,
                body: bodyController.text.isEmpty
                    ? widget.post.body
                    : bodyController.text);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
