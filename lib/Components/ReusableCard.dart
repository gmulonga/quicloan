import 'package:flutter/material.dart';
import 'package:quicloan/Utilis/Constants.dart';
import 'package:animations/animations.dart';
import 'package:quicloan/Utilis/theme_notifier.dart';
import 'package:provider/provider.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({
    required this.label,
    required this.onButtonPressed,
    required this.icon,
  });

  final String label;
  final IconData icon;
  final Widget Function() onButtonPressed;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: OpenContainer(
        closedColor: themeNotifier.isDark ? kDarkTheme1 : kWhite,
        transitionType: ContainerTransitionType.fade,
        openBuilder: (BuildContext context, VoidCallback _) {
          return onButtonPressed() ?? Container();
        },
        closedElevation: 6.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return InkWell(
            onTap: openContainer,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: themeNotifier.isDark ? kDarkTheme1 : kWhite,
                        blurRadius: 10.0,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Icon(
                          icon,
                          size: 40,
                          color: themeNotifier.isDark ? kCream : kSilver,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 3,
                          color: themeNotifier.isDark ? kCream : kSilver,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            label,
                            style: TextStyle(
                                color:
                                    themeNotifier.isDark ? kCream : kNavyBlue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
