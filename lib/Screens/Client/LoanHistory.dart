import 'package:flutter/material.dart';
import 'package:quicloan/Constants.dart';
import 'package:quicloan/Components/ReusableTile.dart';
import 'package:quicloan/Screens/Client/Userscreen.dart';
import 'package:quicloan/Components/InfoDialog.dart';

class LoanHistory extends StatefulWidget {
  @override
  State<LoanHistory> createState() => _LoanHistoryState();
}

class _LoanHistoryState extends State<LoanHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loan History',
          style: TextStyle(color: kCream),
        ),
        backgroundColor: kNavyBlue,
      ),
      backgroundColor: kCream,
      body: SafeArea(
        child: ListView(
          children: [
            ReusableTile(
              date: '10/07/2024',
              status: 'Pending',
              onButtonPressed: () {
                showLoanDetailsDialog(context, '2,000', '15%', '60 days');
              },
            ),
            ReusableTile(
              date: '10/07/2024',
              status: 'Active',
              onButtonPressed: () {
                showLoanDetailsDialog(context, '5,000', '15%', '30 days');
              },
            ),
            ReusableTile(
              date: '10/07/2024',
              status: 'Completed',
              onButtonPressed: () {
                showLoanDetailsDialog(context, '8,000', '15%', '40 days');
              },
            ),
          ],
        ),
      ),
    );
  }
}
