import 'package:facebook_for_web_and_mob/data/data.dart';
import 'package:facebook_for_web_and_mob/screens/screens.dart';
import 'package:facebook_for_web_and_mob/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _screens.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context) ? PreferredSize(
          preferredSize: Size(screenSize.width, 100.0),
          child: CustomAppBar(
            currentUsr: currentUser,
            index: selectedIndex,
            onTap: (index) => setState((){ selectedIndex = index; }),
          ),
        ) : null,
        body: IndexedStack(  // Indexed Stack Saves the state of tabs and also help in navigation between tabs :)
          index: selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Responsive.isDesktop(context) ? SizedBox.shrink() : CustomTabBar(
          index: selectedIndex,
          onTap: (index) => setState((){ selectedIndex = index; }),
        ),
      ),
    );
  }
}
