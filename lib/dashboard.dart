import 'package:amplifyit/views/about.dart';
import 'package:amplifyit/views/home.dart';
import 'package:amplifyit/views/post/add_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/bottom_navigation_bar/bottom_navigation_bar.dart' as bnb;
import 'widgets/bottom_navigation_bar/bottom_navigation_bar_item.dart'
    as bnbitm;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PageController pageController = PageController(initialPage: 0);

  int index = 0;

  final List<bnbitm.BottomNavigationBarItem> items = [
    bnbitm.BottomNavigationBarItem(icon: Icons.dashboard_rounded),
    bnbitm.BottomNavigationBarItem(icon: Icons.add),
    bnbitm.BottomNavigationBarItem(icon: Icons.info)
  ];

  final List<Widget> widgetList = [
    Home(),
    AddPost(),
    About(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: widgetList.length,
        itemBuilder: (context, index) => widgetList[index],
        onPageChanged: (value) {
          setState(() {
            index = value;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bnb.BottomNavigationBar(
        onTap: (index) => pageController.animateToPage(index,
            duration: Duration(milliseconds: 250), curve: Curves.ease),
        curve: Curves.easeInOut,
        items: items,
        currentIndex: index,
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.blueGrey,
      ),
    );
  }
}
