import 'package:flutter/material.dart';
import 'package:quicloan/Constants.dart';
import 'package:quicloan/Components/ReusableTile.dart';
import 'package:quicloan/Screens/Userscreen.dart';

class LoanHistory extends StatefulWidget {
  @override
  State<LoanHistory> createState() => _LoanHistoryState();
}

class _LoanHistoryState extends State<LoanHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      body: SafeArea(
        child: ListView(
          children: [
            ReusableTile(
              date: '10/07/2024',
              status: 'pending',
              onButtonPressed: () {
                return Userspage();
              },
            ),
          ],
        ),
      ),
    );
  }
}
