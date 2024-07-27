import 'package:flutter/material.dart';
import 'package:quicloan/Constants.dart';
import 'package:animations/animations.dart';
import 'package:quicloan/theme_notifier.dart';
import 'package:provider/provider.dart';

class ReusableTile extends StatelessWidget {
  ReusableTile({
    required this.label,
    required this.status,
    required this.onButtonPressed,
  });

  final String label;
  final String status;
  final void Function() onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: onButtonPressed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kNavyBlue,
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Text(
                        label,
                        style: kDarkThemeText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        status,
                        style: kDarkThemeText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
