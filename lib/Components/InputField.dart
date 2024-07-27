import 'package:flutter/material.dart';
import 'package:quicloan/Constants.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quicloan/theme_notifier.dart';

class InputField extends StatelessWidget {
  InputField({
    required this.label,
    this.password = false,
    this.onChanged,
    this.integerOnly = false,
    this.errorText,
    this.isEnabled = true,
  });

  String label;
  bool password;
  final ValueChanged<String>? onChanged;
  final bool integerOnly;
  final errorText;
  bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: themeNotifier.isDark ? kWhite : kNavyBlue),
          ),
          SizedBox(height: 8.0),
          TextField(
            obscureText: password,
            onChanged: onChanged,
            style:
                TextStyle(color: themeNotifier.isDark ? kNavyBlue : kNavyBlue),
            inputFormatters:
                integerOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
            decoration: InputDecoration(
              errorText: errorText,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
              filled: true,
              fillColor: kWhite,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: kNavyBlue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: kOrange),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
