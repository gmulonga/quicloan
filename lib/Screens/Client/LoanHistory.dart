import 'package:flutter/material.dart';
import 'package:quicloan/Utilis/Constants.dart';
import 'package:quicloan/Components/ReusableTile.dart';
import 'package:quicloan/Components/InfoDialog.dart';
import 'package:quicloan/theme_notifier.dart';
import 'package:provider/provider.dart';

class LoanHistory extends StatefulWidget {
  @override
  State<LoanHistory> createState() => _LoanHistoryState();
}

class _LoanHistoryState extends State<LoanHistory> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loan History',
          style: TextStyle(color: kCream),
        ),
        backgroundColor: themeNotifier.isDark ? kDarkTheme1 : kNavyBlue,
      ),
      backgroundColor: themeNotifier.isDark ? kDarkTheme2 : kCream,
      body: SafeArea(
        child: ListView(
          children: [
            ReusableTile(
              label: '10/07/2024',
              status: 'Pending',
              onButtonPressed: () {
                showLoanDetailsDialog(context, '2,000', '15%', '60 days', [
                  DialogButton(
                    label: 'Close',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: kDarkThemeText,
                  ),
                  DialogButton(
                    label: 'Delete',
                    onPressed: () {
                      // Add delete functionality here
                      Navigator.of(context).pop();
                    },
                    style: TextStyle(color: kOrange),
                  ),
                ]);
              },
            ),
            ReusableTile(
              label: '10/07/2024',
              status: 'Active',
              onButtonPressed: () {
                showLoanDetailsDialog(context, '5,000', '15%', '30 days', [
                  DialogButton(
                    label: 'Close',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: kDarkThemeText,
                  ),
                  DialogButton(
                    label: 'Delete',
                    onPressed: () {
                      // Add delete functionality here
                      Navigator.of(context).pop();
                    },
                    style: TextStyle(color: kOrange),
                  ),
                ]);
              },
            ),
            ReusableTile(
              label: '10/07/2024',
              status: 'Completed',
              onButtonPressed: () {
                showLoanDetailsDialog(context, '8,000', '15%', '40 days', [
                  DialogButton(
                    label: 'Close',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: kDarkThemeText,
                  ),
                  DialogButton(
                    label: 'Delete',
                    onPressed: () {
                      // Add delete functionality here
                      Navigator.of(context).pop();
                    },
                    style: TextStyle(color: kOrange),
                  ),
                ]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
