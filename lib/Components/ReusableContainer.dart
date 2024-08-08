import 'package:flutter/material.dart';
import 'package:quicloan/Utilis/Constants.dart';
import 'package:animations/animations.dart';
import 'package:quicloan/Utilis/theme_notifier.dart';
import 'package:provider/provider.dart';

class ReusableContainer extends StatelessWidget {
  ReusableContainer({
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
    return OpenContainer(
      closedColor: themeNotifier.isDark ? kDarkTheme1 : kNavyBlue,
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: themeNotifier.isDark ? kDarkTheme1 : kNavyBlue,
                      blurRadius: 10.0,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Icon(
                        icon,
                        size: 40,
                        color: kSilver,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          label,
                          style: kDarkThemeText,
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
    );
  }
}
