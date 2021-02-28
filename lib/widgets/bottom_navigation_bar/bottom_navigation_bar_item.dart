import 'package:flutter/material.dart';

class BottomNavigationBarItem {
  BottomNavigationBarItem({
    @required this.icon,
    this.backgroundColor = Colors.white,
  });
  final IconData icon;
  final Color backgroundColor;
}
