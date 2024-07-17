import 'package:flutter/material.dart';
import 'package:quicloan/Constants.dart';
import 'package:quicloan/Components/CustomButton.dart';
import 'package:quicloan/Components/InputField.dart';
import 'package:quicloan/Components/MessageHandler.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int phone_number = 0;
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.star,
                  size: 100,
                  color: kSilver,
                ),
                InputField(
                  label: 'Enter Amount',
                  integerOnly: true,
                  onChanged: (value) {
                    setState(() {
                      try {
                        amount = int.parse(value);
                      } catch (e) {
                        amount = 0;
                        print('Invalid input: $e');
                      }
                    });
                  },
                ),
                InputField(
                  label: 'Phone Number',
                  integerOnly: true,
                  onChanged: (value) {
                    setState(() {
                      try {
                        phone_number = int.parse(value);
                      } catch (e) {
                        amount = 0;
                        print('Invalid input: $e');
                      }
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: CustomButton(
                    txtColor: kCream,
                    bgColor: kOrange,
                    callBackFunction: () {
                      setState(() {
                        MessageHandler.showMessage(context,
                            'A prompt up will be sent to 0734567890', kOrange);
                      });
                    },
                    label: 'Make Payment',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}