import 'package:flutter/material.dart';
import 'package:quicloan/Contstants.dart';
import 'package:quicloan/Components/ReusableCard.dart';
import 'package:quicloan/Screens/Userscreen.dart';
import 'package:quicloan/Components/CustomButton.dart';
import 'package:quicloan/Components/ProgressBars.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 15, right: 15),
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
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kWhite,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Outstanding Loan',
                            style: TextStyle(
                              color: kNavyBlue,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Ksh:',
                            style: TextStyle(
                              fontSize: 20,
                              color: kNavyBlue,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '20,000',
                                style:
                                    TextStyle(color: kNavyBlue, fontSize: 35),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Percentage paid',
                                  style: TextStyle(color: kNavyBlue),
                                ),
                                Text(
                                  'Days remaining',
                                  style: TextStyle(color: kNavyBlue),
                                )
                              ],
                            ),
                          ),
                          ProgressBars(
                            percentageValue: 75,
                            daysProgress: 15,
                            maxDays: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                              callBackFunction: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Userspage()),
                                );
                              },
                              label: 'Loan Details',
                              bgColor: kOrange,
                              txtColor: kCream)
                        ],
                      ),
                    ),
                  ),
                ),
                ReusableCard(
                  label: 'Apply For a Loan',
                  icon: Icons.file_open,
                  onButtonPressed: () {
                    return Userspage();
                  },
                ),
                ReusableCard(
                  label: 'Make Payment',
                  icon: Icons.star,
                  onButtonPressed: () {
                    return Userspage();
                  },
                ),
                ReusableCard(
                  label: 'Loan History',
                  icon: Icons.history,
                  onButtonPressed: () {
                    return Userspage();
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
