import 'package:flutter/material.dart';
import 'package:quicloan/Utilis/Constants.dart';
import 'package:quicloan/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:quicloan/Components/Table.dart';

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: themeNotifier.isDark ? kDarkTheme2 : kCream,
        appBar: AppBar(
          backgroundColor: themeNotifier.isDark ? kDarkTheme1 : kNavyBlue,
          title: const Text(
            'Transactions',
            style: TextStyle(color: kCream),
          ),
          bottom: const TabBar(
            labelColor: kOrange,
            indicatorColor: kOrange,
            unselectedLabelColor: kCream,
            tabs: <Widget>[
              Tab(
                text: 'Returned',
              ),
              Tab(
                text: 'Loaned',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TableScreen(),
              ],
            ),
            Column(
              children: [
                TableScreen(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
