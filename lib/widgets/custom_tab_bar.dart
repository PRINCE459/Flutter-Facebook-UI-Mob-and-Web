import 'package:facebook_for_web_and_mob/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final int index;
  final Function(int) onTap;
  final bool bottomIndicator;

  CustomTabBar({required this.index, required this.onTap, this.bottomIndicator = false});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {

  final _icons = [
    Icons.home_outlined,
    Icons.ondemand_video_outlined,
    Icons.account_circle_outlined,
    Icons.people,
    Icons.notifications_outlined,
    Icons.menu,
  ];
  
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: widget.bottomIndicator ? BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: 3.0,
              color: Palette.facebookBlue
          ),
        ),
      ) : BoxDecoration(
        border: Border(
          top: BorderSide(
              width: 3.0,
              color: Palette.facebookBlue
          ),
        ),
      ),
      onTap: widget.onTap,
      tabs: _icons.asMap().map((i, e) => MapEntry(i, Tab(
        icon: Icon(e,
          color: i == widget.index ? Palette.facebookBlue : Colors.black45,
          size: 30.0,
        ),
      ),)).values.toList(),
    );
  }
}
