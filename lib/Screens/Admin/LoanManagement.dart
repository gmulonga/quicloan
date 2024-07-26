import 'package:flutter/material.dart';
import 'package:quicloan/Constants.dart';

class LoanManagement extends StatefulWidget {
  @override
  State<LoanManagement> createState() => _LoanManagementState();
}

class _LoanManagementState extends State<LoanManagement> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                text: 'Loans',
              ),
              Tab(
                text: 'Requests',
              ),
              Tab(
                text: 'History',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("Loans"),
            ),
            Center(
              child: Text("Requests"),
            ),
            Center(
              child: Text("History"),
            ),
          ],
        ),
      ),
    );
  }
}
