import 'package:flutter/material.dart';
import 'package:quicloan/Constants.dart';
import 'package:quicloan/Components/ReusableContainer.dart';
import 'package:quicloan/Screens/Client/SupportScreen.dart';
import 'package:quicloan/Screens/Admin/RegisterScreen.dart';
import 'package:quicloan/Screens/Admin/LoanManagement.dart';
import 'package:quicloan/Screens/Admin/UserManagement.dart';
import 'package:quicloan/theme_notifier.dart';
import 'package:provider/provider.dart';

class Admindashboard extends StatefulWidget {
  @override
  State<Admindashboard> createState() => _AdmindashboardState();
}

class _AdmindashboardState extends State<Admindashboard> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
        backgroundColor: themeNotifier.isDark ? kDarkTheme2 : kCream,
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Hero(
                          tag: 'logo',
                          child: Image(
                            image: AssetImage('images/logo.png'),
                            height: 45,
                            width: 45,
                          ),
                        ),
                        Icon(
                          Icons.notifications,
                          color: themeNotifier.isDark ? kCream : kNavyBlue,
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
                          color: themeNotifier.isDark ? kCream : kNavyBlue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Administrator',
                          style: TextStyle(
                              color: themeNotifier.isDark ? kCream : kNavyBlue),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: ReusableContainer(
                        label: "Loan Overview",
                        onButtonPressed: () {
                          return Supportscreen();
                        },
                        icon: Icons.edit_document),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 5, top: 5, bottom: 5),
                          child: ReusableContainer(
                              label: "User Management",
                              onButtonPressed: () {
                                return SearchBarApp();
                              },
                              icon: Icons.manage_accounts),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 5, right: 15, top: 5, bottom: 5),
                          child: ReusableContainer(
                              label: "Loan management",
                              onButtonPressed: () {
                                return LoanManagement();
                              },
                              icon: Icons.archive),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: ReusableContainer(
                        label: "Transaction Management",
                        onButtonPressed: () {
                          return Supportscreen();
                        },
                        icon: Icons.monetization_on),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: ReusableContainer(
                        label: "Reports",
                        onButtonPressed: () {
                          return Supportscreen();
                        },
                        icon: Icons.add_chart),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
