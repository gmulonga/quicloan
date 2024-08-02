import 'package:flutter/material.dart';
import 'package:quicloan/Constants.dart';
import 'package:quicloan/Components/ReusableTile.dart';
import 'package:quicloan/theme_notifier.dart';
import 'package:provider/provider.dart';

class LoanOverview extends StatefulWidget {
  @override
  State<LoanOverview> createState() => _LoanOverviewState();
}

class _LoanOverviewState extends State<LoanOverview> {
  int interestRate = 0;
  int duration = 0;

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
            'Loan Overview',
            style: TextStyle(color: kCream),
          ),
          bottom: const TabBar(
            labelColor: kOrange,
            indicatorColor: kOrange,
            unselectedLabelColor: kCream,
            tabs: <Widget>[
              Tab(
                text: 'Active',
              ),
              Tab(
                text: 'Completed',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ReusableTile(
                  label: 'Jane Doe',
                  status: '12/02/2024',
                  onButtonPressed: () {},
                ),
                ReusableTile(
                  label: 'John Doe',
                  status: '12/02/2024',
                  onButtonPressed: () {},
                ),
              ],
            ),
            Column(
              children: [
                ReusableTile(
                  label: 'Jane Doe',
                  status: '12/02/2024',
                  onButtonPressed: () {},
                ),
                ReusableTile(
                  label: 'John Doe',
                  status: '12/02/2024',
                  onButtonPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
