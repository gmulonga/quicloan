import 'package:flutter/material.dart';
import 'package:quicloan/Constants.dart';

class DialogButton {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;

  DialogButton({
    required this.label,
    required this.onPressed,
    this.style,
  });
}

void showLoanDetailsDialog(BuildContext context, String loanAmount,
    String interestRate, String duration, List<DialogButton> buttons) {
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
          actions: buttons.map((button) {
            return TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(button.label, style: button.style),
              onPressed: button.onPressed,
            );
          }).toList(),
        ),
      );
    },
  );
}
