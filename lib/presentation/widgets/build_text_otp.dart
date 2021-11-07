import 'package:flutter/material.dart';

import '../../style/color/color.dart';
import 'build_text_field_phone.dart';

Widget buildIntroTextOtp() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Verify your phone number',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 30),
      Container(
        child: RichText(
          text: TextSpan(
            text: 'Enter your 6 digit code numbers sent to you at\n',
            style: TextStyle(
                fontSize: 15, height: 1.4, color: black.withOpacity(0.8)),
            children: <TextSpan>[
              TextSpan(
                text: '+2$phoneNumber',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                  color: blue,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
