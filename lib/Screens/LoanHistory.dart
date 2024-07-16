import 'package:flutter/material.dart';
import 'package:quicloan/Contstants.dart';
import 'package:quicloan/Components/ReusableTile.dart';
import 'package:quicloan/Screens/Userscreen.dart';

class Loanhistory extends StatefulWidget {
  @override
  State<Loanhistory> createState() => _LoanhistoryState();
}

class _LoanhistoryState extends State<Loanhistory> {
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
