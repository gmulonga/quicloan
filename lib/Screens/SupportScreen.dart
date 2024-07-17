import 'package:flutter/material.dart';
import 'package:quicloan/Constants.dart';

class Supportscreen extends StatefulWidget {
  @override
  State<Supportscreen> createState() => _SupportscreenState();
}

class _SupportscreenState extends State<Supportscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Support',
          style: TextStyle(color: kCream),
        ),
        backgroundColor: kNavyBlue,
      ),
      backgroundColor: kCream,
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
                        'Sample text box',
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
