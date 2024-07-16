import 'package:flutter/material.dart';
import 'package:quicloan/Constants.dart';
import 'package:quicloan/Components/ReusableCard.dart';
import 'package:quicloan/Screens/Userscreen.dart';
import 'package:quicloan/Components/CustomButton.dart';
import 'package:quicloan/Components/ProgressBars.dart';
import 'package:quicloan/Screens/LoanAppliaction.dart';
import 'package:quicloan/Screens/Payment.dart';
import 'package:quicloan/Screens/LoanHistory.dart';

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
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kNavyBlue,
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
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Percentage paid',
                                  style: TextStyle(color: kCream),
                                ),
                                Text(
                                  'Days remaining',
                                  style: TextStyle(color: kCream),
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
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 400,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const Text('Modal BottomSheet'),
                                            ElevatedButton(
                                              child: const Text(
                                                  'Close BottomSheet'),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
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
