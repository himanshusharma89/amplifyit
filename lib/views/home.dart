import 'dart:async';

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplifyit/models/ModelProvider.dart';
import 'package:amplifyit/services/post_service.dart';
import 'package:amplifyit/views/post/add_post.dart';
import 'package:amplifyit/widgets/card_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> _posts = <Post>[];
  List<String> _postStreamingData = <String>[];
  Stream<SubscriptionEvent<Post>> postStream;
  StreamSubscription hubSubscription;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    listenToHub();
    // setup streams
    postStream = Amplify.DataStore.observe(Post.classType);
    postStream.listen((event) {
      print('Received event of type ' + event.eventType.toString());
      print('Received post ' + event.item.toString());
      Provider.of<PostService>(context, listen: false).runQueries();
    }).onError((error) => print(error));
  }

  void listenToHub() {
    setState(() {
      hubSubscription = Amplify.Hub.listen([HubChannel.DataStore], (msg) {
        if (msg.eventName == "ready") {
          Provider.of<PostService>(context, listen: false).runQueries();
        }
        // print(msg);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AppBar',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: getWidgetToDisplayPostEvents(context),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => AddPost()));
          },
          child: Text('Write Blog Post')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getWidgetToDisplayPostEvents(BuildContext context) {
    return Consumer<PostService>(builder: (context, ps, child) {
      return FutureBuilder(
          future: ps.runQueries(),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: ps.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardView(post: ps.posts[index]);
                  });
            return Center(
              child: CircularProgressIndicator(),
            );
          });
    });
  }
}
