import 'package:amplify_flutter/amplify.dart';
import 'package:amplifyit/models/Post.dart';
import 'package:flutter/foundation.dart';

class PostService extends ChangeNotifier {
  List<Post> _posts = <Post>[];

  List<Post> get posts => _posts;

  Future<List<Post>> runQueries() async {
    final List<Post> allPosts = <Post>[];

    // get all posts
    (await Amplify.DataStore.query(Post.classType)).forEach((Post element) {
      if (element != null) {
        allPosts.add(element);
      }
    });
    _posts = allPosts;
    notifyListeners();
    return allPosts;
  }

  Future<void> savePost({String title, int date, String body}) async {
    try {
      final Post post = Post(title: title, date: date, body: body);
      await Amplify.DataStore.save(post);
      runQueries();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    notifyListeners();
  }

  Future<void> deletePost(String id) async {
    try {
      await Amplify.DataStore.delete(Post(id: id, title: null));
      runQueries();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    notifyListeners();
  }

  Future<void> updatePost(Post oldPost, {String title, String body}) async {
    try {
      final Post newPost =
          oldPost.copyWith(id: oldPost.id, title: title, body: body);

      await Amplify.DataStore.save(newPost);
      runQueries();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    notifyListeners();
  }
}
