import 'package:amplifyit/services/post_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Add Post",
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Post Title",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(right: 15, left: 15),
                    ),
                    onChanged: (value) => titleController.text = value,
                    onSaved: (val) => titleController.text = val,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Title filed can't be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Post Body",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                          right: 15, top: 15, bottom: 50, left: 15),
                    ),
                    maxLines: 7,
                    onChanged: (value) => bodyController.text = value,
                    onSaved: (val) => bodyController.text = val,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Body field can't be empty";
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        child: Text("Add The Post"),
        onPressed: () {
          Provider.of<PostService>(context).savePost(
              title: titleController.text,
              date: DateTime.now().millisecondsSinceEpoch,
              body: bodyController.text);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}