import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:quicloan/Utilis/Constants.dart';
import 'package:quicloan/Utilis/theme_notifier.dart';

class Supportscreen extends StatefulWidget {
  @override
  State<Supportscreen> createState() => _SupportscreenState();
}

class _SupportscreenState extends State<Supportscreen> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customer Support',
          style: TextStyle(color: kCream),
        ),
        backgroundColor: themeNotifier.isDark ? kDarkTheme1 : kNavyBlue,
      ),
      backgroundColor: themeNotifier.isDark ? kDarkTheme2 : kCream,
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      color: kNavyBlue,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Customer support',
                        style: kDarkThemeText,
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
