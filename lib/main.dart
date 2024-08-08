import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicloan/Screens/Homescreen.dart';
import 'package:quicloan/Screens/Loginscreen.dart';
import 'package:quicloan/Utilis/theme_notifier.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

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
