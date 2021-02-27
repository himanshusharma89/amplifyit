import 'package:flutter/material.dart';

class BottomNavigationBarItem {
  final IconData icon;
  final Color backgroundColor;

  BottomNavigationBarItem({
    @required this.icon,
    this.backgroundColor = Colors.white,
  });
}