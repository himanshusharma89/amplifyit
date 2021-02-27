import 'package:amplifyit/dashboard.dart';
import 'package:amplifyit/models/Post.dart';
import 'package:amplifyit/views/about.dart';
import 'package:amplifyit/views/home.dart';
import 'package:amplifyit/views/login.dart';
import 'package:amplifyit/views/post/add_post.dart';
import 'package:amplifyit/views/post/edit_post.dart';
import 'package:amplifyit/views/post/view_post.dart';
import 'package:amplifyit/views/undefined_route.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class RoutePage {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.AUTH:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => LogIn(),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );

      case RouteConstant.ROOT:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => Dashboard(),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );

      case RouteConstant.ADD_POST:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => AddPost(),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );

      case RouteConstant.EDIT_POST:
        Post post = settings.arguments as Post;
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => EditPost(post),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );

      case RouteConstant.VIEW_POST:
        Post post = settings.arguments as Post;
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => PostView(post),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );

      case RouteConstant.ABOUT:
        return PageRouteBuilder(
          settings: settings,
            pageBuilder: (_, __, ___) => About(),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );

      default:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => UndefinedView(
              routeName: settings.name,
            ),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );
    }
  }
}
