import 'package:flutter/material.dart';
import 'package:quicloan/Utilis/Constants.dart';

class ProgressBars extends StatelessWidget {
  final double percentageValue;
  final double daysProgress;
  final double maxDays;

  ProgressBars({
    required this.percentageValue,
    required this.daysProgress,
    required this.maxDays,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Percentage Paid ${percentageValue}%',
            style: TextStyle(color: kCream),
          ),
        ),
        SizedBox(
          height: 10,
          child: LinearProgressIndicator(
            backgroundColor: kCream,
            valueColor: AlwaysStoppedAnimation<Color>(kOrange),
            value: percentageValue / 100,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            '${daysProgress.toInt()} Days remaining',
            style: TextStyle(color: kCream),
          ),
        ),
        SizedBox(
          height: 10,
          child: LinearProgressIndicator(
            backgroundColor: kCream,
            valueColor: AlwaysStoppedAnimation<Color>(kOrange),
            value: daysProgress / maxDays,
          ),
        ),
      ],
    );
  }
}
