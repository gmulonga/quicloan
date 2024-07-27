import 'package:flutter/material.dart';
import 'package:quicloan/Constants.dart';
import 'package:animations/animations.dart';

void showLoanDetailsDialog(BuildContext context, String loanAmount,
    String interestRate, String duration) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Theme(
        data: Theme.of(context).copyWith(
          dialogTheme: DialogTheme(
            backgroundColor: kNavyBlue,
            titleTextStyle: TextStyle(color: kCream, fontSize: 20),
            contentTextStyle: TextStyle(color: kCream),
          ),
        ),
        child: AlertDialog(
          title: const Text('Loan Details'),
          content: Text(
            'Loan Amount: $loanAmount\n'
            'Interest Rate: $interestRate\n'
            'Duration: $duration',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text('Close', style: kDarkThemeText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text('Delete', style: TextStyle(color: kOrange)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
