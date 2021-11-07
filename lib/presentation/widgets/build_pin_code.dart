import '../screens/otp_screen.dart';

import '../../style/color/color.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

Widget buildPinCodeFields(context) {
  return Container(
    child: PinCodeTextField(
      appContext: context,
      autoFocus: true,
      cursorColor: black,
      keyboardType: TextInputType.phone,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(4),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: .5,
        activeColor: blue.withOpacity(0.4),
        inactiveColor: blue.withOpacity(0.4),
        inactiveFillColor: white,
        activeFillColor: white,
        selectedColor: blue,
        selectedFillColor: white,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: white,
      enableActiveFill: true,
      onCompleted: (code) {
        otpCode = code;
      },
      onChanged: (value) {},
    ),
  );
}
