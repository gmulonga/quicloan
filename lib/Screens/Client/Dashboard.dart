import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:quicloan/Utilis/Constants.dart';
import 'package:quicloan/Utilis/theme_notifier.dart';
import 'package:quicloan/Components/ReusableCard.dart';
import 'package:quicloan/Components/ProgressBars.dart';
import 'package:quicloan/Screens/Client/LoanAppliaction.dart';
import 'package:quicloan/Screens/Client/Payment.dart';
import 'package:quicloan/Screens/Client/LoanHistory.dart';


class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double percentage = 50;
  double remaining_days = 7;
  double maxDays = 60;

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
                        color: themeNotifier.isDark ? kSilver : kNavyBlue,
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
                        color: themeNotifier.isDark ? kSilver : kNavyBlue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Jane Doe',
                        style: TextStyle(
                          color: themeNotifier.isDark ? kSilver : kNavyBlue,
                        ),

                        // style: kLightThemeText,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: themeNotifier.isDark ? kDarkTheme1 : kNavyBlue,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Outstanding Loan',
                            style: TextStyle(
                              color: kCream,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Ksh:',
                            style: TextStyle(
                              fontSize: 20,
                              color: kCream,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '20,000',
                                style: TextStyle(color: kCream, fontSize: 35),
                              )
                            ],
                          ),
                          ProgressBars(
                            percentageValue: percentage,
                            daysProgress: remaining_days,
                            maxDays: maxDays,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ReusableCard(
                  label: 'Apply For a Loan',
                  icon: Icons.file_copy,
                  onButtonPressed: () {
                    return LoanApplication();
                  },
                ),
                ReusableCard(
                  label: 'Make Payment',
                  icon: Icons.star,
                  onButtonPressed: () {
                    return PaymentScreen();
                  },
                ),
                ReusableCard(
                  label: 'Loan History',
                  icon: Icons.history,
                  onButtonPressed: () {
                    return LoanHistory();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
