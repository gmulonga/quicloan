import 'package:flutter/material.dart';
import 'package:quicloan/Contstants.dart';
import 'package:quicloan/Components/ReusableCard.dart';
import 'package:quicloan/Screens/Userscreen.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: kCream,
        body: SafeArea(
            child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.bolt,
                        color: kNavyBlue,
                      ),
                      Icon(
                        Icons.notifications,
                        color: kNavyBlue,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: kNavyBlue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Jane Doe',
                        style: kLightThemeText,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    height: screenHeight / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kOrange),
                  ),
                ),
                ReusableCard(
                  label: 'Label',
                  icon: Icons.add,
                  onButtonPressed: () {
                    return Userspage();
                  },
                ),
                ReusableCard(
                  label: 'LABEL',
                  icon: Icons.add,
                  onButtonPressed: () {
                    return Userspage();
                  },
                ),
                ReusableCard(
                  label: 'LABEL',
                  icon: Icons.add,
                  onButtonPressed: () {
                    return Userspage();
                  },
                ),
              ],
            ),
          ],
        )));
  }
}
