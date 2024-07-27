import 'package:flutter/material.dart';
import 'package:quicloan/Constants.dart';
import 'package:quicloan/Components/InputField.dart';
import 'package:quicloan/Components/MessageHandler.dart';
import 'package:quicloan/Components/CustomButton.dart';
import 'package:quicloan/Components/ReusableTile.dart';
import 'package:quicloan/Components/InfoDialog.dart';

class LoanManagement extends StatefulWidget {
  @override
  State<LoanManagement> createState() => _LoanManagementState();
}

class _LoanManagementState extends State<LoanManagement> {
  int interestRate = 0;
  int duration = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: kCream,
        appBar: AppBar(
          backgroundColor: kNavyBlue,
          title: const Text(
            'Loan Management',
            style: TextStyle(color: kCream),
          ),
          bottom: const TabBar(
            labelColor: kOrange,
            indicatorColor: kOrange,
            unselectedLabelColor: kCream,
            tabs: <Widget>[
              Tab(
                text: 'Loan Limits',
              ),
              Tab(
                text: 'Requests',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                InputField(
                  label: 'Interest Rate',
                  onChanged: (value) {
                    setState(() {
                      interestRate = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                InputField(
                  label: 'Maximum Duration',
                  onChanged: (value) {
                    setState(() {
                      duration = int.tryParse(value) ?? 0;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: CustomButton(
                    txtColor: kCream,
                    bgColor: kOrange,
                    callBackFunction: () {
                      setState(() {
                        MessageHandler.showMessage(
                            context, 'You have sucesfully updated', kOrange);
                      });
                    },
                    label: 'Update',
                  ),
                )
              ],
            ),
            Column(
              children: [
                ReusableTile(
                  label: 'user1@gmail.com',
                  status: 'Pending',
                  onButtonPressed: () {
                    showLoanDetailsDialog(context, '2,000', '15%', '60 days');
                  },
                ),
                ReusableTile(
                  label: 'user2@gmail.com',
                  status: 'Pending',
                  onButtonPressed: () {
                    showLoanDetailsDialog(context, '2,000', '15%', '60 days');
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
