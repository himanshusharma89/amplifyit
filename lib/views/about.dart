import 'package:amplifyit/helpers/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            children: <Widget>[
              const Text(
                'Want to pen down your thoughts in the form of a blog anonymously?',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'This is just the App for you! You can post your blogs and no one can know about the original poster.',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 5.0,
                      margin: const EdgeInsets.only(top: 45.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0, bottom: 15),
                        child: Column(
                          children: <Widget>[
                            const Text('Himanshu Sharma',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                )),
                            const SizedBox(
                              height: 10.0,
                            ),
                            SvgPicture.asset('assets/flutter_dev.svg',
                                height: 80),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: social
                                    .map(
                                      (Social e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: GestureDetector(
                                          onTap: () => launcher.launcher(e.URL),
                                          child: CachedNetworkImage(
                                            imageUrl: e.iconURL,
                                            height: 26,
                                            width: 26,
                                            placeholder: (_, String str) =>
                                                const CircularProgressIndicator(),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList()),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              'The Developer behind this project',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
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
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 5.0,
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Column(
                      children: <Widget>[
                        const Text('Contributing',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 10.0),
                        const Text(
                          'If you wish to contribute a change to any of the existing features in this application, please review our contribution guide and send a pull request.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: () => launcher.launcher(
                              'https://github.com/himanshusharma89/amplifyit'),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://img.icons8.com/fluent/50/000000/github.png',
                            height: 26,
                            width: 26,
                            placeholder: (_, String str) =>
                                const CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
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
  Data(this.img, this.data);
  String img;
  String data;
} //Class to hold the image path and data to be displayed
