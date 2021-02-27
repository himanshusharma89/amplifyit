import 'package:amplifyit/helpers/launcher.dart';

final Launcher launcher = Launcher();

/// ROUTE CONSTANTS

class RouteConstant {
  static const AUTH = "/auth";
  static const ROOT = "/";
  static const ADD_POST = "/add-post";
  static const EDIT_POST = "/edit-post";
  static const VIEW_POST = "/view-post";
  static const ABOUT = "/about";
}

/// SOCIAL LINKS

List social = [
  {
    'URL': 'https://github.com/himanshusharma89',
    'iconURL': 'https://img.icons8.com/fluent/50/000000/github.png'
  },
  {
    'URL': 'https://twitter.com/_SharmaHimanshu',
    'iconURL': 'https://img.icons8.com/color/48/000000/twitter.png'
  },
  {
    'URL': 'https://www.linkedin.com/in/himanshusharma89/',
    'iconURL': 'https://img.icons8.com/color/48/000000/linkedin.png'
  },
];

// var introSlider = [
//   PageViewModel(
//     text: "Do you have ideas that you want to pen down?",
//     image: "Blog3.png",
//   ),
//   PageViewModel(
//     text: "Looking for a spot to write blogs?",
//     image: "Blog2.png",
//   ),
//   PageViewModel(
//     text:
//         "You came to the right place!\nWrite, read and even fetch articles from internet!",
//     image: "Blog1.jpg",
//   ),
// ];