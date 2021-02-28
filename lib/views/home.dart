import 'dart:async';

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:amplifyit/models/ModelProvider.dart';
import 'package:amplifyit/services/post_service.dart';
import 'package:amplifyit/widgets/card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.globalKey}) : super(key: key);
  final GlobalKey<ScaffoldState> globalKey;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream<SubscriptionEvent<Post>> postStream;

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
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: const Offset(2, 2),
                        color: Colors.grey[300],
                        blurRadius: 6),
                  ]),
              child: const Icon(Icons.menu_rounded),
            ),
          ),
        ),
        title: const Text(
          'AmplifyIt',
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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Write Blog\nAnonymously',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 26, height: 1.5),
                    ),
                    SvgPicture.asset(
                      'assets/blog_post.svg',
                      height: 100,
                    )
                  ],
                ),
              ),
              const SizedBox(
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
    return Consumer<PostService>(builder: (_, PostService ps, Widget child) {
      return FutureBuilder<List<Post>>(
          future: ps.runQueries(),
          builder: (_, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: ps.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardView(post: ps.posts[index]);
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
    });
  }
}
