import 'package:amplifyit/helpers/launcher.dart';

final Launcher launcher = Launcher();

/// ROUTE CONSTANTS

class RouteConstant {
  // ignore: constant_identifier_names
  static const String AUTH = '/auth';
  // ignore: constant_identifier_names
  static const String ROOT = '/';
  // ignore: constant_identifier_names
  static const String ADD_POST = '/add-post';
  // ignore: constant_identifier_names
  static const String EDIT_POST = '/edit-post';
  // ignore: constant_identifier_names
  static const String VIEW_POST = '/view-post';
  // ignore: constant_identifier_names
  static const String ABOUT = '/about';
}

/// SOCIAL LINKS

List<Social> social = <Social>[
  Social(
      URL: 'https://github.com/himanshusharma89',
      iconURL: 'https://img.icons8.com/fluent/50/000000/github.png'),
  Social(
      URL: 'https://twitter.com/_SharmaHimanshu',
      iconURL: 'https://img.icons8.com/color/48/000000/twitter.png'),
  Social(
      URL: 'https://www.linkedin.com/in/himanshusharma89/',
      iconURL: 'https://img.icons8.com/color/48/000000/linkedin.png')
];

class Social {
  // ignore: non_constant_identifier_names
  Social({this.URL, this.iconURL});

  // ignore: non_constant_identifier_names
  final String URL;
  final String iconURL;
}
