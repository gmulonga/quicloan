import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:quicloan/Screens/Client/Dashboard.dart';
import 'package:quicloan/Utilis/Constants.dart';
import 'package:quicloan/Screens/Client/Userscreen.dart';
import 'package:quicloan/Screens/Settings.dart';
import 'package:quicloan/Screens/Client/SupportScreen.dart';
import 'package:quicloan/Screens/Admin/AdminDashboard.dart';
import 'package:quicloan/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:quicloan/Services/quicloanAPI.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  bool isAdmin = false;
  late User loggedInUser;
  QuicloanAPI api = QuicloanAPI();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = api.getCurrentUser();
      if (user != null) {
        setState(() {
          loggedInUser = user;
          getAdmin();
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void getAdmin() {
    if (loggedInUser.email == "admin@gmail.com") {
      isAdmin = true;
    } else {
      isAdmin = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    PageController _myPage = PageController(initialPage: 0);

    return Scaffold(
      backgroundColor: kCream,
      extendBody: true,
      floatingActionButton: OpenContainer(
        closedColor: kOrange,
        transitionType: ContainerTransitionType.fade,
        openBuilder: (BuildContext context, VoidCallback _) {
          return Supportscreen();
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
              Icons.chat,
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
        color: themeNotifier.isDark ? kDarkTheme1 : kNavyBlue,
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
                color: _selectedIndex == 0 ? kOrange : kCream,
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
                color: _selectedIndex == 1 ? kOrange : kCream,
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
                Icons.settings,
                color: _selectedIndex == 2 ? kOrange : kCream,
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
                color: _selectedIndex == 3 ? kOrange : kCream,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                  api.signOut();
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
          isAdmin ? Admindashboard() : Dashboard(),
          Userspage(),
          Settings(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
