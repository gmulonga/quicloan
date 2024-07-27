import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicloan/Screens/Homescreen.dart';
import 'package:quicloan/Screens/Loginscreen.dart';
import 'package:quicloan/theme_notifier.dart'; // Correct import path

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness:
                  themeNotifier.isDark ? Brightness.dark : Brightness.light,
              useMaterial3: true,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => Loginscreen(),
              '/homePage': (context) => Homepage(),
            },
          );
        },
      ),
    );
  }
}
