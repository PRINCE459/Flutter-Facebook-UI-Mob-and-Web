import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  Responsive({
    required this.mobile,
    required this.desktop,
    this.tablet,
});

  // to check if a screen size is of mobile
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 800;
  // to check if a screen size is of tablet
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 800 && MediaQuery.of(context).size.width < 1200 ;
  // to check if a screen size is of desktop
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        if(constraints.maxWidth >= 1200){
          return desktop;
        } else if(constraints.maxWidth >= 800 && constraints.maxWidth < 1200) {
          return mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
