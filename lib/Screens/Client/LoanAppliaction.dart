import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:quicloan/Utilis/Constants.dart';
import 'package:quicloan/Utilis/theme_notifier.dart';
import 'package:quicloan/Components/InputField.dart';
import 'package:quicloan/Components/CustomButton.dart';
import 'package:quicloan/Components/MessageHandler.dart';


class LoanApplication extends StatefulWidget {
  @override
  State<LoanApplication> createState() => _LoanApplicationState();
}

class _LoanApplicationState extends State<LoanApplication> {
  int amount = 0;
  double duration = 30;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Apply For Loan',
          style: TextStyle(color: kCream),
        ),
        backgroundColor: themeNotifier.isDark ? kDarkTheme1 : kNavyBlue,
      ),
      backgroundColor: themeNotifier.isDark ? kDarkTheme2 : kCream,
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image(
                    image: AssetImage('images/logo.png'),
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputField(
                    label: 'Enter Amount',
                    integerOnly:
                        true, // Assuming this is a custom property you have defined in InputField
                    onChanged: (value) {
                      setState(() {
                        try {
                          amount = int.parse(value);
                        } catch (e) {
                          amount = 0;
                          print('Invalid input: $e');
                        }
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 15),
                    child: Text(
                      'Interest rate: 15%',
                      style: TextStyle(
                          color: themeNotifier.isDark ? kWhite : kNavyBlue),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 15),
                    child: Text(
                      'Loan Payment duration: ${duration.round()} Days',
                      style: TextStyle(
                          color: themeNotifier.isDark ? kWhite : kNavyBlue),
                    ),
                  ),
                  Slider(
                    activeColor: kOrange,
                    inactiveColor: themeNotifier.isDark ? kWhite : kNavyBlue,
                    value: duration,
                    min: 0,
                    max: 60,
                    divisions: 10,
                    label: duration.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        duration = value;
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
                              context, 'You have applied for a Loan', kOrange);
                        });
                      },
                      label: 'Apply',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
