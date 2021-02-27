import 'package:amplify_flutter/amplify.dart';
import 'package:amplifyit/models/Post.dart';
import 'package:flutter/foundation.dart';

class PostService extends ChangeNotifier {
  List<Post> _posts = <Post>[];

  List<Post> get posts => _posts;

  runQueries() async {
    List<Post> allPosts = <Post>[];

    // get all posts
    (await Amplify.DataStore.query(Post.classType)).forEach((element) {
      if (element != null) {
        allPosts.add(element);
      }
    });
    _posts = allPosts;
    notifyListeners();
    return allPosts;
  }

  savePost({String title, int date, String body}) async {
    try {
      Post post = Post(title: title, date: date, body: body);
      await Amplify.DataStore.save(post);
      runQueries();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  deletePost(String id) async {
    try {
      await Amplify.DataStore.delete(Post(id: id, title: null));
      runQueries();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  updatePost(Post oldPost, {String title, String body}) async {
    try {
      Post newPost = oldPost.copyWith(id: oldPost.id, title: title, body: body);

      await Amplify.DataStore.save(newPost);
      runQueries();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
