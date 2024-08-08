import 'package:flutter/material.dart';
import 'package:quicloan/Utilis/Constants.dart';
import 'package:quicloan/Utilis/theme_notifier.dart';
import 'package:provider/provider.dart';

class TableScreen extends StatefulWidget {
  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final List<String> rows = ['5000', '2000', '400', '500'];

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: rows.length,
      itemBuilder: (context, index) {
        final row = rows[index];
        final LightThemeColor = index % 2 == 0 ? kCream : kWhite;
        final DarkThemeColor = index % 2 == 0 ? kDarkTheme2 : kDarkTheme1;
        return Container(
          color: themeNotifier.isDark ? DarkThemeColor : LightThemeColor,
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                row,
                style: TextStyle(color: kNavyBlue),
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                color: kNavyBlue,
                onPressed: () {
                  print('Add button pressed on $row');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
