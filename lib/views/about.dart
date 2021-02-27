import 'package:amplifyit/helpers/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Want to pen down your thoughts in the form of a blog anonymously?",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "This is just the App for you! You can post your blogs and no one can know about the original poster.",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: Card(
                      elevation: 5.0,
                      margin: const EdgeInsets.only(top: 45.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Himanshu Sharma",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                )),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: social
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: GestureDetector(
                                            child: CachedNetworkImage(
                                              imageUrl: e['iconURL'],
                                              height: 26,
                                              width: 26,
                                              placeholder: (_, str) =>
                                                  CircularProgressIndicator(),
                                            ),
                                            onTap: () =>
                                                launcher.launcher(e['URL'])),
                                      ),
                                    )
                                    .toList()),
                            SizedBox(
                              height: 10.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'The Developer behind this project',
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: .0,
                    left: .0,
                    right: .0,
                    child: Center(
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage: CachedNetworkImageProvider(
                            'https://avatars0.githubusercontent.com/u/44980497?v=4'),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 5.0,
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Contributing",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600)),
                        SizedBox(height: 10.0),
                        Text(
                          "If you wish to contribute a change to any of the existing features in this application, please review our contribution guide and send a pull request.",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10.0),
                        GestureDetector(
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://img.icons8.com/fluent/50/000000/github.png',
                              height: 26,
                              width: 26,
                              placeholder: (_, str) =>
                                  CircularProgressIndicator(),
                            ),
                            onTap: () => launcher.launcher(
                                'https://github.com/himanshusharma89/amplifyit')),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Data {
  String img;
  String data;

  Data(this.img, this.data);
} //Class to hold the image path and data to be displayed
