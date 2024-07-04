import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:quicloan/Screens/Dashboard.dart';
import 'package:quicloan/Contstants.dart';
import 'package:quicloan/Screens/Userscreen.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageController _myPage = PageController(initialPage: 0);
    return Scaffold(
      backgroundColor: kCream,
      extendBody: true,
      floatingActionButton: OpenContainer(
        closedColor: kOrange,
        transitionType: ContainerTransitionType.fade,
        openBuilder: (BuildContext context, VoidCallback _) {
          return Userspage();
        },
        closedElevation: 6.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(56)),
        ),
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return FloatingActionButton(
            onPressed: openContainer,
            backgroundColor: kOrange,
            child: Icon(
              Icons.menu,
              color: kCream,
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 6.0,
        shadowColor: kOrange,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        color: kOrange,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 25.0,
              padding: EdgeInsets.only(left: 28.0),
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0 ? kNavyBlue : kCream,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                  _myPage.jumpToPage(0);
                });
              },
            ),
            IconButton(
              iconSize: 25.0,
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(
                Icons.people,
                color: _selectedIndex == 1 ? kNavyBlue : kCream,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                  _myPage.jumpToPage(1);
                });
              },
            ),
            IconButton(
              iconSize: 25.0,
              padding: EdgeInsets.only(left: 28.0),
              icon: Icon(
                Icons.message,
                color: _selectedIndex == 2 ? kNavyBlue : kCream,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                  _myPage.jumpToPage(2);
                });
              },
            ),
            IconButton(
              iconSize: 25.0,
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(
                Icons.logout,
                color: _selectedIndex == 3 ? kNavyBlue : kCream,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;

                  Navigator.pop(context);
                });
              },
            )
          ],
        ),
      ),
      body: PageView(
        controller: _myPage,
        children: <Widget>[
          Dashboard(),
          Userspage(),
          Userspage(),
          Userspage(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
