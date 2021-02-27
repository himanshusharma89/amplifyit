import 'package:amplifyit/views/about.dart';
import 'package:amplifyit/views/home.dart';
import 'package:amplifyit/views/post/add_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/bottom_navigation_bar/bottom_navigation_bar.dart' as bnb;
import 'widgets/bottom_navigation_bar/bottom_navigation_bar_item.dart'
    as bnbitm;
import 'widgets/drawer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PageController pageController = PageController(initialPage: 0);
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  int index = 0;

  final List<bnbitm.BottomNavigationBarItem> items = [
    bnbitm.BottomNavigationBarItem(icon: Icons.home_rounded),
    bnbitm.BottomNavigationBarItem(icon: Icons.add_circle_rounded),
    bnbitm.BottomNavigationBarItem(icon: Icons.info_rounded)
  ];

  List<Widget> widgetList = [];

  @override
  void initState() {
    super.initState();
    widgetList = [
      Home(
        globalKey: _globalKey,
      ),
      AddPost(),
      About(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
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
      drawer: BlogDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bnb.BottomNavigationBar(
        onTap: (index) => pageController.animateToPage(index,
            duration: Duration(milliseconds: 250), curve: Curves.ease),
        curve: Curves.easeInOut,
        items: items,
        currentIndex: index,
        inactiveColor: Colors.blueGrey,
      ),
    );
  }
}
