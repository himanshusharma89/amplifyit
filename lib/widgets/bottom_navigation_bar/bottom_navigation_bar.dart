import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import 'bottom_navigation_bar_item.dart' as bnbitm;

// ignore: must_be_immutable
class BottomNavigationBar extends StatefulWidget {
  final Curve curve;
  final Color activeColor;
  final Color inactiveColor;
  final Color inactiveStripColor;
  final Color indicatorColor;
  final bool enableShadow;
  int currentIndex;
  final ValueChanged<int> onTap;
  final List<bnbitm.BottomNavigationBarItem> items;

  BottomNavigationBar({
    Key key,
    this.curve = Curves.linear,
    @required this.onTap,
    @required this.items,
    this.activeColor,
    this.inactiveColor,
    this.inactiveStripColor,
    this.indicatorColor,
    this.enableShadow = true,
    this.currentIndex = 0,
  })  : assert(items != null),
        assert(items.length >= 2 && items.length <= 6),
        assert(onTap != null),
        assert(currentIndex != null),
        assert(enableShadow != null),
        super(key: key);

  @override
  State createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  static const double BAR_HEIGHT = kBottomNavigationBarHeight;
  static const double INDICATOR_HEIGHT = 2;
  double width = 0;
  Color activeColor;
  Duration duration = Duration(milliseconds: 270);

  Curve get curve => widget.curve;

  List<bnbitm.BottomNavigationBarItem> get items => widget.items;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    activeColor = widget.activeColor ?? Theme.of(context).indicatorColor;

    return Container(
      height: BAR_HEIGHT,
      width: width,
      decoration: BoxDecoration(
        color: widget.inactiveStripColor ?? Theme.of(context).cardColor,
        boxShadow: widget.enableShadow
            ? [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ]
            : null,
      ),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: <Widget>[
          Positioned(
            top: INDICATOR_HEIGHT,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () => _select(index),
                  child: _buildItemWidget(item, index == widget.currentIndex),
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 0,
            width: width,
            child: AnimatedAlign(
              alignment:
                  Alignment(_getIndicatorPosition(widget.currentIndex), 0),
              curve: curve,
              duration: duration,
              child: Container(
                color: widget.indicatorColor ?? activeColor,
                width: width / items.length,
                height: INDICATOR_HEIGHT,
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr)
      return lerpDouble(-1.0, 1.0, index / (items.length - 1));
    else
      return lerpDouble(1.0, -1.0, index / (items.length - 1));
  }

  _select(int index) {
    widget.currentIndex = index;
    widget.onTap(widget.currentIndex);

    setState(() {});
  }

  Widget _buildIcon(bnbitm.BottomNavigationBarItem item, bool isSelected) {
    return Icon(
      item.icon,
      color: isSelected ? activeColor : widget.inactiveColor,
      size: 25,
    );
  }

  Widget _buildItemWidget(
      bnbitm.BottomNavigationBarItem item, bool isSelected) {
    return Container(
        color: item.backgroundColor,
        height: BAR_HEIGHT,
        width: width / items.length,
        child: Center(
          child: _buildIcon(item, isSelected),
        ));
  }
}
