import 'package:amplifyit/helpers/constants.dart';
import 'package:amplifyit/services/post_service.dart';
import 'package:amplifyit/widgets/blog_button.dart';
import 'package:amplifyit/widgets/text_form_field_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddPost extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Add Post',
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
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          SvgPicture.asset('assets/add_post.svg', height: 200),
        ],
      ),
      floatingActionButton: BlogButton(
        text: 'Add The Post',
        onTap: () {
          PostService().savePost(
              title: titleController.text,
              date: DateTime.now().millisecondsSinceEpoch,
              body: bodyController.text);
          Navigator.pushReplacementNamed(context, RouteConstant.ROOT);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
