import 'dart:async';

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:amplifyit/models/ModelProvider.dart';
import 'package:amplifyit/services/post_service.dart';
import 'package:amplifyit/widgets/card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;

  const Home({Key key, this.globalKey}) : super(key: key);

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
  }

  // Future<void> initPlatformState() async {
  //   listenToHub();
  //   // setup streams
  //   postStream = Amplify.DataStore.observe(Post.classType);
  //   postStream.listen((event) {
  //     print('Received event of type ' + event.eventType.toString());
  //     print('Received post ' + event.item.toString());
  //     Provider.of<PostService>(context, listen: false).runQueries();
  //   }).onError((error) => print(error));
  // }

  // void listenToHub() {
  //   setState(() {
  //     hubSubscription = Amplify.Hub.listen([HubChannel.DataStore], (msg) {
  //       if (msg.eventName == "ready") {
  //         Provider.of<PostService>(context, listen: false).runQueries();
  //       }
  //       // print(msg);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => widget.globalKey.currentState.openDrawer(),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(2, 2),
                        color: Colors.grey[300],
                        blurRadius: 6),
                  ]),
              child: Icon(Icons.menu_rounded),
            ),
          ),
        ),
        title: Text(
          'Amplifyit',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Write Blog\nAnonymously',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 26, height: 1.5),
                    ),
                    SvgPicture.asset(
                      'assets/blog_post.svg',
                      fit: BoxFit.contain,
                      height: 100,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              getWidgetToDisplayPostEvents(context),
            ],
          ),
        ),
      ),
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
                  reverse: false,
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
